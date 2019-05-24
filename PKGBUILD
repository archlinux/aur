# Maintainer: alcubierre-drive
pkgname=backlight-tooler
pkgrel=4
pkgver=r26.4172d35
pkgdesc="A lightweight tool to control backlight via webcam."
arch=('any')
url="https://github.com/alcubierre-drive/backlight-tooler"
license=('GPL')
depends=('systemd' 'glibc')
makedepends=('git' 'gcc' 'make')
source=("git://github.com/alcubierre-drive/${pkgname}.git")
md5sums=('SKIP')
backup=('etc/backlight-tooler.conf')
install=backlight-tooler.install

pkgver() {
    cd "$pkgname"
    git checkout 4172d3512bd6944aab11d5d2b31880a67c3856a7
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    : Nothing
}

build() {
    cd "${srcdir}/${pkgname}"
    git checkout 4172d3512bd6944aab11d5d2b31880a67c3856a7
    make
}

check() {
    : Nothing
}

package() {
    cd "${srcdir}/${pkgname}"
    PREFIX="$pkgdir/" make install
}
