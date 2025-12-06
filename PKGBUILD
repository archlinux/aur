# Maintainer: Filth <filth [at] wagn [dot] me>

_gemname="array_include_methods"
pkgname="ruby-$_gemname"
pkgver=1.5.1
pkgrel=1
arch=("any")
pkgdesc="Array include methods missing from the basic Ruby array API."
url="https://rubygems.org/gems/$_gemname"
license=("MIT")
depends=("ruby")
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
b2sums=('3b974f9283a0a18c76e5c00efe1dcfe0a7c189bb320a1f263b853fda1123d5010b5495896148344a8002350ca2151c375dc969697d76d86d9714eb6e3950a24c')
noextract=("$_gemname-$pkgver.gem")
options=(!emptydirs)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
