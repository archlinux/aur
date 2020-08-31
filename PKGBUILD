# Maintainer: ejiek <ejiek@mail.ru>
# Contributor: jskier <jay @jskier.com>
pkgname=keeper-commander
pkgver=4.37
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
sha512sums=('79e55edec11840fe48e505935d2c69df00b352ced956e22cd219c0bc2d44ab53cc5e8eb0c14b59e2eacf29280e520059c650e6135cdc7c7d605f6411c52a9a9b')

package() {
  cd "Commander-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
