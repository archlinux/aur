# Maintainer: Wojciech Kepka <wojciech@wkepka.dev>
pkgname=pkger-rs
pkgver=0.2.0
pkgrel=1
epoch=
pkgdesc='Build rpm, deb, pkg and other packages using Docker'
arch=('x86_64')
url='https://github.com/wojciechkepka/pkger'
license=('MIT')
depends=()
makedepends=('cargo')
provides=("pkger")
conflicts=("pkger")
sha1sums=('SKIP')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")

PACKAGE_NAME="pkger"
SOURCE_DIR="${PACKAGE_NAME}-${pkgver}"

build() {
    cd $SOURCE_DIR
    cargo build --release
}

package() {
	cd $SOURCE_DIR
	install -Dm755 "target/release/pkger" "${pkgdir}/usr/bin/pkger"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${PACKAGE_NAME}/README.md"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${PACKAGE_NAME}/LICENSE"
}
