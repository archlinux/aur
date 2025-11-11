# Maintainer: Filth <filth [at] wagn [dot] me>

_gemname="http-2"
pkgname="ruby-$_gemname"
pkgver=1.1.1
pkgrel=1
arch=("any")
pkgdesc="Pure-Ruby HTTP 2.0 protocol implementation"
url="https://rubygems.org/gems/$_gemname"
license=("MIT")
depends=("ruby")
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('1141a5a03c2f4e6b8d2fa62394de581e1ff6387711cd7ed577212e9d95562bba')
noextract=("$_gemname-$pkgver.gem")
options=(!emptydirs)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
