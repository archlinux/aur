# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_py=cp310

_name=primp
pkgname=python-${_name}-bin
pkgver=1.1.1
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
b2sums=('8cba0172337e5d98e948cb5ad383b143a407edfa4b455881c73e44c4f3431b76d400e34e77c6c2c1dea1f4d20ca3367138dc77d9bd153cf02e884ef592e04a9f'
        'a29664104e1ee73ca0aee1d633e9095d92a57c92787f8d8740bdb7211ba3205782ed8677f539bdb8cae3dd75a3694be3132e185fa3fc4b3f401e1f88eb776101')

package() {
  python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-${_py}-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
