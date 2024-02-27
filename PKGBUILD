# Maintainer: Popolon <popolon @ popolon. org>
# made with pip2pkgbuild

pkgname='python-crc'
_module='crc'
_src_folder='crc-6.1.1'
pkgver='6.1.1'
pkgrel=1
pkgdesc="Library and CLI to calculate and verify all kinds of CRC checksums"
url="https://github.com/Nicoretti/crc"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:BSD License')
arch=('any')
source=("https://files.pythonhosted.org/packages/34/d6/8f8d6ed8d8e71ad2f538058f2608dfed0312ca8a95c56c52b44fa99368fb/crc-6.1.1.tar.gz")
sha256sums=('934085e4128a9d3079df70b70bca330e6d298c8a2191899903272f4e53f3220d')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
