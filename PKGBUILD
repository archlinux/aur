# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=wg-meshconf
pkgver=2.5.1
pkgrel=2
pkgdesc="WireGuard full mesh configuration generator"
arch=('any')
url="https://github.com/k4yt3x/wg-meshconf"
license=('GPL-3.0-or-later')
depends=('python' 'python-cryptography' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-pdm' 'python-pdm-pep517')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/w/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7c73b57b4da0ba9d32835fd4cff8d6fae99c15a50115499c896686b364065650')

build() {
  cd "${pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}
