# Maintainer: alcubierre-drive
pkgname=backlight-tooler
pkgrel=1
pkgver=r40.8c0f89c
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
    git checkout 8c0f89c0d5752d2adbc7a45fa5826eb42215ecbe
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    : Nothing
}

build() {
    cd "${srcdir}/${pkgname}"
    git checkout 8c0f89c0d5752d2adbc7a45fa5826eb42215ecbe
    make
}

check() {
    : Nothing
}

package() {
    cd "${srcdir}/${pkgname}"
    PREFIX="$pkgdir/" make install
}
