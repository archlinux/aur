# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=pwgen-passphrase
pkgver=1.2
pkgrel=1
pkgdesc="Secure wordlist-based passphrase generator"
arch=('any')
url="https://github.com/xmikos/pwgen-passphrase"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-pyqt5: copying to clipboard' 'python-regex-hg: better regex Unicode support')
source=(https://github.com/xmikos/pwgen-passphrase/archive/v$pkgver.tar.gz)
sha256sums=('f73e150946ff2a4edd5a2f5186dc143d9056bab01929598e0963ba33ddedcdc9')

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
