# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

_name=aioimaplib
pkgname=python-aioimaplib
pkgver=0.7.15
pkgrel=1
pkgdesc='Python asyncio IMAP4rev1 client library'
arch=('any')
url='https://github.com/bamthomas/aioimaplib'
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("$_name-$pkgver.tar.gz::https://github.com/bamthomas/${pkgname#python-}/archive/${pkgver}.tar.gz")
sha256sums=('1f7cf0af7884fe7168a7c6a690920eb3c155b473cc658468c7a79d3ca120b10f')


build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
