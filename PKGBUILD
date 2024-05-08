# Maintainer: Popolon <popolon @ popolon. org>
# made with pip2pkgbuild

pkgname='python-crc'
_module='crc'
pkgver='7.0.0'
pkgrel=1
pkgdesc="Library and CLI to calculate and verify all kinds of CRC checksums"
url="https://github.com/Nicoretti/crc"
depends=('python' 'python-poetry')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:BSD License')
arch=('any')
source=("https://github.com/Nicoretti/crc/releases/download/${pkgver}/${_module}-${pkgver}.tar.gz")
sha256sums=('b9fc521042167f2b59d9183ce27acc0897e4a17748421e8b304ccdf7ebf4280a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
