# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='gnome-keyring-import-export-hg'
pkgver='r19.657ba95e254c'
pkgrel='2'
pkgdesc='Simple script for exporting gnome2 (seahorse) keyrings, using the SecretService API'
arch=('any')
url='https://bitbucket.org/spookylukey/gnome-keyring-import-export'
license=('unknown')
depends=('python' 'python-secretstorage')
makedepends=('mercurial')
provides=('gnome-keyring-import-export')
source=("$pkgname::hg+https://bitbucket.org/spookylukey/gnome-keyring-import-export")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r`hg identify -n`.`hg identify -i`"
}

package() {
	install -Dm755 "$srcdir/$pkgname/secret_storage_import_export.py" "$pkgdir/usr/bin/secret-storage-import-export"
}
