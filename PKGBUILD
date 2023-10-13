# Maintainer: alcubierre-drive
pkgname=files2clip
pkgrel=1
pkgver=r3.d596234
pkgdesc="A simple daemon that consumes files in a directory and pastes them to clipboard"
arch=('any')
url="https://github.com/alcubierre-drive/files2clip"
license=('GPL')
depends=('gtk3')
makedepends=('gcc' 'make')
source=("git+http://github.com/alcubierre-drive/${pkgname}.git")
md5sums=('SKIP')
# backup=('etc/backlight-tooler.conf')
# install=backlight-tooler.install

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
}
