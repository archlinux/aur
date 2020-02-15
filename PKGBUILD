# Maintainer: Hao Long <aur@esd.cc>

_gemname=options
pkgname=ruby-$_gemname
pkgver=2.3.2
pkgrel=1
pkgdesc='parse options from *args cleanly'
arch=(any)
url='https://github.com/ahoward/options'
license=(RUBY)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('32413a4b9e363234eed2eecfb2a1a9deb32810f72c54820a37a62f65b905c5e8')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
