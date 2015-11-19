# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=pwgen-passphrase
pkgver=1.1
pkgrel=1
pkgdesc="Secure wordlist-based passphrase generator"
arch=('any')
url="https://github.com/xmikos/pwgen-passphrase"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-pyqt5: copying to clipboard' 'python-regex-hg: better regex Unicode support')
source=(https://github.com/xmikos/pwgen-passphrase/archive/v$pkgver.tar.gz)
sha256sums=('cb69c99596d156b1c82e838ce1eaf4fcd592cabac26d73e0fec545d1aebea7dd')

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
