# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_py=cp38

_name=primp
pkgname=python-${_name}-bin
pkgver=0.12.1
pkgrel=1
pkgdesc='HTTP client that can impersonate web browsers, mimicking their headers and `TLS/JA3/JA4/HTTP2` fingerprints'
arch=('x86_64')
url="https://github.com/deedy5/${_name}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
provides=("python-primp")
conflicts=("python-primp")
source=(https://files.pythonhosted.org/packages/${_py}/${_name::1}/$_name/${_name//-/_}-$pkgver-$_py-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
              https://raw.githubusercontent.com/deedy5/primp/refs/tags/v${pkgver}/LICENSE)
sha256sums=('79380b72b3afad1aead8c4ac91797dce37605561e9a4be9dd9291d6132fdc5e7'
            '64f0fdb426abd21f75b48e2ff93b9976b8c374bab3538af33d3c6d3f7c7efae7')

package() {
  python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-${_py}-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
