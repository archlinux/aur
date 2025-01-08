# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_py=cp38

_name=primp
pkgname=python-${_name}-bin
pkgver=0.10.0
pkgrel=2
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
sha256sums=('a959e9a83cff0ae7a85a02cc183e4db636f69ff41dddb7c4e32f997924923417'
            '64f0fdb426abd21f75b48e2ff93b9976b8c374bab3538af33d3c6d3f7c7efae7')

package() {
  python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-${_py}-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
