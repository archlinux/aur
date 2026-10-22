# Maintainer: Ryan Putrama Yahya <punkofthedeath at gmail.com>
pkgname=apparmor-language-server
pkgver=0.10.0
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
sha256sums=('5bd65cdc3b5572570ef3f6d62ed093990856e1c32701247217979a03e4e1534f')

build() {
  cd "${pkgname}-v${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-v${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
