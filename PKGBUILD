# Maintainer: Cyrus Troy Bazar <bazartroy531@google.com>

pkgname=neo-candy-icons-git
_pkgname=neo-candy-icons
pkgver=r57.c3bb698
pkgrel=1
pkgdesc="Neo candy icons (git version)"
arch=('any')
url="https://github.com/erikdubois/${_pkgname}"
license=('GPL-3.0-or-later')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!emptydirs')
source=("git+${url}.git")
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm644 "${_pkgname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -dm 755 "${pkgdir}/usr/share/icons/"
  cp -r "${srcdir}/${_pkgname}/usr/share/icons/"* "${pkgdir}/usr/share/icons/"
}
