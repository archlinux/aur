# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='gnome-keyring-import-export-hg'
pkgver='r15.db0c7ce80e60'
pkgrel='3'
pkgdesc='Simple script for exporting gnome2 (seahorse) keyrings, and re-importing on another machine.'
arch=('any')
url='https://bitbucket.org/spookylukey/gnome-keyring-import-export'
license=('unknown')
depends=('python2' 'pygtk' 'python2-gnomekeyring' 'python2-lxml')
makedepends=('mercurial')
provides=('gnome-keyring-import-export')
conflicts=('gnome-keyring-import-export')
source=(
	"$pkgname::hg+https://bitbucket.org/spookylukey/gnome-keyring-import-export"
	'gnome-keyring-import-export'
)
sha256sums=(
	'SKIP'
	'94332a7c3a6774e47453dde54b0663bb4bf5d2f38782f737aa65abc8980d18e3'
)

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r`hg identify -n`.`hg identify -i`"
}

package() {
	install -dm755 "$pkgdir/usr/bin/"
	install -dm755 "$pkgdir/usr/lib/gnome-keyring-import-export"

	install -m755 "$srcdir/gnome-keyring-import-export" "$pkgdir/usr/bin"
	install -m644 "$srcdir/$pkgname/gnome_keyring_import_export.py" "$pkgdir/usr/lib/gnome-keyring-import-export"
}
