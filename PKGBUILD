# Maintainer: alcubierre-drive
pkgname=backlight-tooler
pkgrel=2
pkgver=r15.1a63461
pkgdesc="A collection of tools to control backlight via webcam."
arch=('any')
url="https://github.com/alcubierre-drive/backlight-tooler"
license=('GPL')
depends=('systemd' 'glibc')
makedepends=('git' 'gcc' 'make')
source=("git://github.com/alcubierre-drive/${pkgname}.git")
md5sums=('SKIP')
backup=('etc/backlight-tooler.conf' 'etc/BacklightTooler.conf')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    : Nothing
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

check() {
    : Nothing
}

package() {
    cd "${srcdir}/${pkgname}"
    PREFIX="$pkgdir/" make install
    for i in {1..2}; do
        echo
    done
    echo "WARNING"
    echo "Changed all the filenames to lowercase+hyphen. Consider reenabling the"
    echo "systemd services and moving the config file."
    for i in {1..2}; do
        echo
    done
}
