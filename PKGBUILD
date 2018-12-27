# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# PKGBUILD Based on : python-aiohttp/PKGBUILD 

_pkgname=python-aiohttp_socks
pkgname=python-aiohttp_socks
pkgver=20181214
pkgrel=1
pkgdesc='SOCKS proxy connector for aiohttp'
url='https://github.com/romis2012/aiohttp-socks'
arch=('x86_64')
license=('Apache')
depends=('python-aiohttp')
makedepends=('python-pytest')
source=(${pkgname}::"git+https://github.com/romis2012/aiohttp-socks.git")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

build() {
  cd ${pkgname}
  python setup.py build
}

check() {
  cd ${pkgname}
  python setup.py test
}

package() {
  cd ${pkgname}
  python setup.py install --root="${pkgdir}" -O1 --skip-build
}

# vim: ts=2 sw=2 et:
