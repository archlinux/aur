# Maintainer: alcubierre-drive
pkgname=backlight-tooler
pkgrel=1
pkgver=r44.f35fb2a
pkgdesc="A lightweight tool to control backlight via webcam."
arch=('any')
url="https://github.com/alcubierre-drive/backlight-tooler"
license=('GPL')
depends=('systemd' 'glibc' 'linux-headers')
makedepends=('git' 'gcc' 'make')
source=("git+http://github.com/alcubierre-drive/${pkgname}.git")
md5sums=('SKIP')
backup=('etc/backlight-tooler.conf')
install=backlight-tooler.install

pkgver() {
    cd "$pkgname"
    git checkout f35fb2a30e798c01bbd9f71348813a6dc8f9b90e
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    : Nothing
}

build() {
    cd "${srcdir}/${pkgname}"
    git checkout f35fb2a30e798c01bbd9f71348813a6dc8f9b90e
    make
}

check() {
    : Nothing
}

package() {
    cd "${srcdir}/${pkgname}"
    PREFIX="$pkgdir/" make install
}
