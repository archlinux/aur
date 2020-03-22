# Maintainer: Patrice Peterson <runiq at archlinux dot us>

pkgname=jrnl
pkgver=2.3
pkgrel=1
pkgdesc="A simple command line journal application that stores your journal in a plain text file"
arch=('any')
url="https://maebert.github.io/jrnl"
license=('MIT')
depends=('python-parsedatetime>=1.2'
         'python-yaml>=5.1.2'
         'python-pytz>=2013b'
         'python-six>=1.6.1'
         'python-tzlocal>=1.1'
         'python-keyring>=3.3'
         'python-dateutil>=2.2'
         'python-passlib>=1.6.2'
         'python-asteval>=0.9.8'
         'python-xdg>=0.26')
optdepends=('python-crypto: AES256-encrypted journal')
source=("https://pypi.python.org/packages/source/j/$pkgname/$pkgname-${pkgver}.tar.gz")
sha256sums=('ede6b3783562b03eaab64679d1913d335079535dbc8cca83bffbd65dacb4bcb6')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
