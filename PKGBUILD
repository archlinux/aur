# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname=demonos-core-fonts
_pkgname=fonts
pkgver=1.r.
pkgrel=1
epoch=
pkgdesc="The fonts installed in demonos."
arch=('any')
url="https://github.com/demonkingswarn/fonts.git"
license=('GPL3')
groups=()
depends=()
makedepends=(git fontconfig)
checkdepends=()
optdepends=()
provides=(demonos-core-fonts)
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
    printf "1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -d ${pkgdir}/usr/local/share/fonts/
  cp -r ${srcdir}/${_pkgname}/* ${pkgdir}/usr/local/share/fonts/
  fc-cache -vf
}
