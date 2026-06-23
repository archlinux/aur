# Maintainer: Ryan Putrama Yahya <punkofthedeath at gmail.com>
pkgname=apparmor-language-server
pkgver=0.8.2
pkgrel=1
pkgdesc='Language server for AppArmor profiles '
arch=('any')
url='https://gitlab.com/apparmor/apparmor-language-server'
license=('GPL3')
depends=('python' 'python-pygls' 'python-lsprotocol')
makedepends=('python-setuptools')
source=("$url/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('c68d0b8ab7cca56e745fb2712164088610caa5f89daff91dcba89fb9b1e1d706')

build() {
  cd "${pkgname}-v${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-v${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
