# Maintainer: alcubierre-drive
pkgname=backlight-tooler
pkgrel=1
pkgver=r43.160eda1
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
    git checkout 160eda1bbb20a992360a67b9542f749acce4380d
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    : Nothing
}

build() {
    cd "${srcdir}/${pkgname}"
    git checkout 160eda1bbb20a992360a67b9542f749acce4380d
    make
}

check() {
    : Nothing
}

package() {
    cd "${srcdir}/${pkgname}"
    PREFIX="$pkgdir/" make install
}
