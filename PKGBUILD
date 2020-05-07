# Maintainer: ejiek <ejiek@mail.ru>
# Contributor: jskier <jay @jskier.com>
pkgname=keeper-commander
pkgver=4.31
pkgrel=1
pkgdesc="CLI, SDK and interactive shell for Keeper® Password Manager."
arch=('any')
url="https://github.com/Keeper-Security/Commander"
license=('MIT')
depends=('python'
         'python-colorama'
         'python-pycryptodomex'
         'python-libkeepass'
         'python-requests'
         'python-tabulate'
         'python-prompt_toolkit'
         'python-asciitree'
         'python-protobuf'
         'python-pyperclip'
         )
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('772d7c8eeb9432a4f49a8c772e7b8d786c6384b9fc399dbfda357596103ec491ece131d490fce0404b8bfcc98cecc645d7017499d1e2706fdbe8ec12fe71d8d0')

package() {
  cd "Commander-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
