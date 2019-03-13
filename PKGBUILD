# Maintainer: farawayer <farwayer@gmail.com>

_gemname=gh_inspector
pkgname=ruby-$_gemname
pkgver=1.1.3
pkgrel=2
pkgdesc='Search through GitHub issues for your project for existing issues about a Ruby Error.'
arch=(any)
url='https://github.com/orta/gh_inspector'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('7725127a82bcefcb2a17fa2f03eed4f5ebd77399')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
