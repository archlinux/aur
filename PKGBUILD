# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

_name=aioimaplib
pkgname=python-aioimaplib
pkgver=0.8.0
pkgrel=1
pkgdesc='Python asyncio IMAP4rev1 client library'
arch=('any')
url='https://github.com/bamthomas/aioimaplib'
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("$_name-$pkgver.tar.gz::https://github.com/bamthomas/${pkgname#python-}/archive/${pkgver}.tar.gz")
sha256sums=('350f53e0cb7fd2276cb0480cb8332ca19a3615c761c07a1395c7c0aa580bfe30')


build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
