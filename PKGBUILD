# Maintainer: Ted W. <ted.l.wood@gmail.com>
pkgname=dewey-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Command-line framework for open ebook libraries (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/tedwardd/dewey"
license=('MIT')
depends=('python')
provides=('dewey')
conflicts=('dewey')
install=dewey.install
source_x86_64=("dewey-${pkgver}-x86_64.tar.gz::https://github.com/tedwardd/dewey/releases/download/v${pkgver}/dewey-linux-x86_64-v${pkgver}.tar.gz")
source_aarch64=("dewey-${pkgver}-aarch64.tar.gz::https://github.com/tedwardd/dewey/releases/download/v${pkgver}/dewey-linux-aarch64-v${pkgver}.tar.gz")
sha256sums_x86_64=('9bf06484be314578a005f8da5cee3073449ca84cccc13df9f17aeb7a08ffb937')
sha256sums_aarch64=('a9475e7de2a5be68c1096e152b3f97d517cfef6b3509aecdf5e151fb69d16555')

package() {
    install -Dm755 "${srcdir}/dewey-${pkgver}/dewey" "${pkgdir}/usr/bin/dewey"
    install -Dm644 "${srcdir}/dewey-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
