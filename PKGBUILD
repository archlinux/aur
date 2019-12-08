# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='gnome-keyring-import-export'
pkgname="$_pkgname-hg"
pkgver='r19.657ba95e254c'
pkgrel='3'
pkgdesc='Simple script for exporting gnome2 (seahorse) keyrings, using the SecretService API - Mercurial version'
arch=('any')
url="https://bitbucket.org/spookylukey/$_pkgname"
license=('unknown')
depends=('python' 'python-secretstorage')
makedepends=('mercurial')
provides=("$_pkgname")
source=("$pkgname::hg+$url")
sha256sums=('SKIP')

_sourcedirectory="$pkgname"

pkgver() {
	cd "$srcdir/$_sourcedirectory"
	printf 'r%s.%s' "$(hg identify -n)" "$(hg identify -i)"
}

package() {
	install -Dm755 "$srcdir/$_sourcedirectory/secret_storage_import_export.py" "$pkgdir/usr/bin/secret-storage-import-export"
}
