# Maintainer: Jonne Haß <me@jhass.eu>
_gemname=pony
pkgname=ruby-$_gemname
pkgver=1.13.1
pkgrel=2
pkgdesc="Send email in one command: Pony.mail(:to => 'someone@example.com', :body => 'hello')"
arch=(any)
url='http://github.com/benprew/pony'
license=(MIT)
depends=(ruby ruby-mail)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('d2beca94911719aad91b027c25c4c48a8f2fb423')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
