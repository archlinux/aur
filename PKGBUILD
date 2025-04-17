# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_py=cp38

_name=primp
pkgname=python-${_name}-bin
pkgver=0.15.0
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
b2sums=('903c7f4e0faaeecdeba999caa27800552b8eb830b35d0cd0a45a9e07225594201dc95a6318715fd33d4e992dc1b69a791af739c15ade95a0891596542c1a84e0'
        'a1800e74b6305e799d483a97b81a71c744fb94f344536aa16414dff2f96a9d9469d0adbc9e1cad69d76aca30a4390c81c825ab088f7d87dcfa3e73e437a7efcb')

package() {
  python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-${_py}-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
