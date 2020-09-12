# Maintainer: gmes78 <gmes.078 at gmail dot com>

pkgname=python-blake3
pkgver=0.1.7
pkgrel=1
pkgdesc="Python bindings for the BLAKE3 cryptographic hash function"
arch=(x86_64 i686 aarch64 armv7h)
url="https://github.com/oconnor663/blake3-py"
license=('Apache' 'custom:CC0-1.0')

depends=('python')
makedepends=('python-pip' 'rust')

source=("blake3-py-${pkgver}.tar.gz"::"https://github.com/oconnor663/blake3-py/archive/${pkgver}.tar.gz")
sha512sums=('e0847d49e1da383a89bda8e5daa2813de0837071c09a45199837b00911c17a1ed4623f0d969511fafb93d3a5aafb875779212ffd4cc30f47f1ab3fe234c3dfdd')

package() {
    cd "blake3-py-${pkgver}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    PIP_CONFIG_FILE=/dev/null pip install --root="$pkgdir/" --isolated --ignore-installed --no-deps --no-binary=blake3 --use-pep517 .
}
