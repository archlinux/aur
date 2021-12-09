# Maintainer: Daniel Peukert <daniel@peukert.cc>
_pkgname='gnome-keyring-import-export'
pkgname="$_pkgname-git"
pkgver='r20.g6b55065'
pkgrel='2'
pkgdesc='Simple script for exporting Gnome/Seahorse keyrings, and re-importing on another machine - git version'
arch=('any')
url="https://github.com/spookylukey/$_pkgname"
license=('unknown')
depends=('python' 'python-secretstorage')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
sha512sums=('SKIP')

_sourcedirectory="$pkgname"

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 'secret_storage_import_export.py' "$pkgdir/usr/bin/secret-storage-import-export"
}
