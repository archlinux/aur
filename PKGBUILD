# Maintainer: ejiek <ejiek@mail.ru>
# Contributor: jskier <jay @jskier.com>
pkgname=keeper-commander
pkgver=16.6.14
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
sha512sums=('44f174c1e9f49020cc52b014f27763d2b4daf60a818309cd3780dee046b8f8e6db2715e876fffb8f2dac2dd4608bf2da856b6ad8d65feac8893f1cb05e926b73')

package() {
  cd "Commander-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
