# Maintainer: BlackFuffey <fluffistical@gmail.com>

_py=cp310

_name=primp
pkgname=python-${_name}-bin
pkgver=1.3.1
pkgrel=1
pkgdesc='HTTP client that can impersonate web browsers, mimicking their headers and `TLS/JA3/JA4/HTTP2` fingerprints'
arch=('x86_64')
url="https://github.com/deedy5/${_name}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
provides=("python-primp")
conflicts=("python-primp")
source=('https://files.pythonhosted.org/packages/34/bb/9b66986b7ecf2eff987134cd94bde533142e3085d6f67531f1a369ceaaae/primp-1.3.1-cp310-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl' "https://raw.githubusercontent.com/deedy5/primp/refs/tags/v${pkgver}/LICENSE")
b2sums=('07625f0e11b10c9c00158c470d3d14b66c8cc62ca70848de148709aab5e527da03052eb7215775de6b045562e1b41ff46c21a2144292741638950f1addd1e98d'
        'a29664104e1ee73ca0aee1d633e9095d92a57c92787f8d8740bdb7211ba3205782ed8677f539bdb8cae3dd75a3694be3132e185fa3fc4b3f401e1f88eb776101')

package() {
  python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-${_py}-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
