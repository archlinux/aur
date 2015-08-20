# Maintainer: Patrice Peterson <runiq at archlinux dot us>

pkgname=jrnl
pkgver=1.9.8
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
         'python-dateutil>=2.2')
optdepends=('python-crypto: AES256-encrypted journal')
source=("https://pypi.python.org/packages/source/j/$pkgname/$pkgname-${pkgver}.tar.gz")
sha256sums=('d254c9c8f24dcf985b98a1d5311337c7f416e6305107eec34c567f58c95b06f4')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
