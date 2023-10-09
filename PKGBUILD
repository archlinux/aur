# Maintainer: ejiek <ejiek@mail.ru>
# Contributor: jskier <jay @jskier.com>
pkgname=keeper-commander
pkgver=16.8.18
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
	 'keeper-secrets-manager-core>=16.2.0'
         )
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('f65dbf52f8504a860a7ed3259f02b0de0876b299438017503263bfd493348310f13bd29172f9a1b7aa7fa3a3b969d1cc85d3ccd8056c5a39b7ff14f33d273528')

package() {
  cd "Commander-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
