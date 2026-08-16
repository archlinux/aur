# Maintainer: Ted W. <ted.l.wood@gmail.com>
pkgname=dewey-bin
pkgver=0.1.0
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
sha256sums_x86_64=('abd0600aeefd0e749b7cfc1943d243856d75356dfa56952afc52dc685cab49df')
sha256sums_aarch64=('17c9a21005bdb561ad77804312fd906d880ea4f8d1307e0a2e98fded3aab0dcf')

package() {
    install -Dm755 "${srcdir}/dewey-${pkgver}/dewey" "${pkgdir}/usr/bin/dewey"
    install -Dm644 "${srcdir}/dewey-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
