# Maintainer: gmes78 <gmes.078 at gmail dot com>

pkgname=python-blake3
pkgver=0.1.8
pkgrel=1
pkgdesc="Python bindings for the BLAKE3 cryptographic hash function"
arch=(x86_64 i686 aarch64 armv7h)
url="https://github.com/oconnor663/blake3-py"
license=('Apache' 'custom:CC0-1.0')

depends=('python')
makedepends=('python-pip' 'rust')

source=("blake3-py-${pkgver}.tar.gz"::"https://github.com/oconnor663/blake3-py/archive/${pkgver}.tar.gz")
sha512sums=('0df92f971a0701e85998f619b9114320b757dfcbfeb3d5cbdd8361c5801e94872130f5cbc0715c49d1b8b7d761ec5d8ef3001b13beb8e925ed7b9d5cd3874b5a')

package() {
    cd "blake3-py-${pkgver}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    PIP_CONFIG_FILE=/dev/null pip install --root="$pkgdir/" --isolated --ignore-installed --no-deps --no-binary=blake3 --use-pep517 .
}
