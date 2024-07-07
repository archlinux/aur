# Maintainer: mdaniels5757 <arch at mdaniels dot me>
# Contributor: ejiek <ejiek@mail.ru>
# Contributor: jskier <jay @jskier.com>
pkgname=keeper-commander
pkgver=16.11.4
pkgrel=1
pkgdesc="CLI, SDK and interactive shell for Keeper® Password Manager."
arch=('any')
url="https://github.com/Keeper-Security/Commander"
license=('MIT')
depends=('python'
		 'python-asciitree'
		 'python-bcrypt'
		 'python-colorama'
		 'python-prompt_toolkit'
		 'python-pycryptodomex'
		 'python-pyperclip'
		 'python-pysocks'
		 'python-tabulate'
		 'python-websockets'
		 'python-fido2'
		 'python-setuptools'
		 'python-requests>=2.30.0'
 	 	 'keeper-secrets-manager-core>=16.6.0'
 	 	 'python-aiortc'
 	 	 'python-protobuf>=3.19.0'
 	 	 'python-cryptography>=39.0.1'
         # 'python-pytest'
		 # 'python-qrcode'
	 	  'python-google-api-core'
  	 	  'python-paramiko'
  	 	  'python-pykeepass'
  	 	  'python-ldap3'
  	 	  'python-botocore'
  	 	  'python-msal'
  	 	  'python-pymssql'
  	 	  'python-pymysql'
  	 	  'python-oracledb'
  	 	  'python-psycopg2'
  	 	  # Undocumented
  	 	  'python-ifaddr'
         )
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a23d665ab0c16ace8f64006fb6541abf0437c67c4ebbbfdcddf2cab5ad6d031b1e5aa429d12ae39ffa2397f18c902f881597aef932583ccfc7e373539c063dd9')

package() {
  cd "Commander-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
