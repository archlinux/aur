# Maintainer: Adrian Lopez <zeioth@hotmail.com>
pkgname=rofi-zeal-git
pkgver=1.0.r13.ef0a629
pkgrel=2
epoch=
pkgdesc="Search code documentation from rofi"
arch=(any)
url="https://github.com/Zeioth/rofi-zeal.git"
license=('MIT')
groups=()
depends=()
makedepends=(git rofi zeal)
checkdepends=()
optdepends=()
provides=(rofi-zeal)
conflicts=(rofi-zeal)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "${_pkgname}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p ~/.cache/rofi/rofi-zeal/
    install -Dm755 "${srcdir}/rofi-zeal/rofi-zeal.sh" "${pkgdir}/usr/bin/rofi-zeal"
}
