# Maintainer: Ryan Putrama Yahya <punkofthedeath at gmail.com>
pkgname=apparmor-language-server
pkgver=0.9.3
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
sha256sums=('6c8ab5011b533388e54d0036760b7d451c1e7aadfd74bb9aee9a36c6d8ca1c98')

build() {
  cd "${pkgname}-v${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-v${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
