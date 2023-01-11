# Maintainer: ejiek <ejiek@mail.ru>
# Contributor: jskier <jay @jskier.com>
pkgname=keeper-commander
pkgver=16.8.10
pkgrel=1
pkgdesc="CLI, SDK and interactive shell for Keeper® Password Manager."
arch=('any')
url="https://github.com/Keeper-Security/Commander"
license=('MIT')
depends=('python'
         'python-colorama'
         'python-pycryptodomex'
         'python-requests'
         'python-tabulate'
         'python-prompt_toolkit'
         'python-asciitree'
         'python-pytest'
         'python-protobuf'
         'python-pyperclip'
         )
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('12686935b83acb4845d4a753142858c0dd8e8e487c30880116b23fdaf4614542fbda5a0cb17db5b1c40f3a5485be168539ec196effba34ae3cb0922c28eeb489')

package() {
  cd "Commander-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
