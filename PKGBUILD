# Maintainer: ejiek <ejiek@mail.ru>
# Contributor: jskier <jay @jskier.com>
pkgname=keeper-commander
pkgver=16.10.0
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
sha512sums=('2dca44357e50c161c08ad9db153b07acf30be785ba1b21e26bc8ffc99ca5d6aa78c2ad219358dcdf1735ba9148d5e6feb96591676f30d48a5ba4a729fe908b64')

package() {
  cd "Commander-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
