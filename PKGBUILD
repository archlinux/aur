# Maintainer: ejiek <ejiek@mail.ru>
# Contributor: jskier <jay @jskier.com>
pkgname=keeper-commander
pkgver=16.10.5
pkgrel=1
pkgdesc="CLI, SDK and interactive shell for Keeper® Password Manager."
arch=('any')
url="https://github.com/Keeper-Security/Commander"
license=('MIT')
depends=('python'
         'python-colorama'
         'python-pycryptodomex'
	 'python-paramiko'
         'python-requests'
         'python-tabulate'
         'python-prompt_toolkit'
         'python-asciitree'
         'python-pytest'
         'python-protobuf'
         'python-pyperclip'
	 'python-qrcode'
	 'python-fido2'
	 'keeper-secrets-manager-core>=16.2.0'
         )
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('3a29d99b7c519108c5434497a920b72968096626ef08266fce644c4e1e00b4d4f69d709e5b016478d909e6808f587297ac35b2b2ed50607b669dfb3065e0c26a')

package() {
  cd "Commander-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
