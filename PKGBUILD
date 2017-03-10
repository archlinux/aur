# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>

_pkgbasename=varela-round-font
pkgname="${_pkgbasename}-git"
pkgver=r43.22f3af8
pkgrel=1
pkgdesc="Varela Round is a sansserif typeface with rounded corners"
url="https://github.com/alefalefalef/Varela-Round-Hebrew"
arch=(any)
license=('custom:SIL')
source=("${_pkgbasename}::git://github.com/alefalefalef/Varela-Round-Hebrew.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbasename}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgbasename}"
  install -d "$pkgdir/usr/share/fonts/${_pkgbasename%-font}"
  install -t "$pkgdir/usr/share/fonts/${_pkgbasename%-font}" -m644 fonts/*.ttf
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
