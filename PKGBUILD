# Maintainer: Patrice Peterson <runiq at archlinux dot us>

pkgname=jrnl
pkgver=2.0.1
pkgrel=1
pkgdesc="A simple command line journal application that stores your journal in a plain text file"
arch=('any')
url="https://maebert.github.io/jrnl"
license=('MIT')
depends=('python-parsedatetime>=1.2'
         'python-pytz>=2013b'
         'python-six>=1.6.1'
         'python-tzlocal>=1.1'
         'python-keyring>=3.3'
         'python-dateutil>=2.2'
         'python-passlib>=1.6.2'
         'python-asteval>=0.9.8')
optdepends=('python-crypto: AES256-encrypted journal')
source=("https://pypi.python.org/packages/source/j/$pkgname/$pkgname-${pkgver}.tar.gz")
sha256sums=('473b0ec7836b838269c09a17462a98e4dcdafa139fbff2a237eb7ab83dcc316a')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
