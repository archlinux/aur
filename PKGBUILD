# Maintainer: Ryan Putrama Yahya <punkofthedeath at gmail.com>
pkgname=apparmor-language-server
pkgver=0.9.4
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
sha256sums=('c9d440bd1c2bfe68083852beab9f5f62912f8fa32bb0ba57c0c08e10f3e7fad5')

build() {
  cd "${pkgname}-v${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-v${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
