# Maintainer: Ryan Putrama Yahya <punkofthedeath at gmail.com>
pkgname=apparmor-language-server
pkgver=0.9.1
pkgrel=1
pkgdesc='Language server for AppArmor profiles '
arch=('any')
url='https://gitlab.com/apparmor/apparmor-language-server'
license=('GPL3')
depends=('python' 'python-pygls' 'python-lsprotocol')
makedepends=('python-setuptools'
  'python-build'
  'python-installer')
source=("$url/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('6bbdd6ecbb398957a6b53d15782666084be9c428f34d76947d6263f9e1933e03')

build() {
  cd "${pkgname}-v${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-v${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
