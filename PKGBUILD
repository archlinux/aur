# Maintainer: hcra <hcra at u53r dot space>

pkgname=notes-cli-bin
_pkgname=notes-cli
pkgver=1.6.0
pkgrel=1
pkgdesc="Small markdown note taking commandline application written in go."
arch=('i686' 'x86_64')
url="https://github.com/rhysd/notes-cli"
license=('MIT')
source=("$_pkgname-$pkgver.zip::https://github.com/rhysd/notes-cli/releases/download/v$pkgver/notes_linux_amd64.zip")
sha1sums=('17560a53fb3cf3e172c8ae5efd7d624878479023')

package() {
	cd "${srcdir##-bin}"

	install -Dm755 "notes" "$pkgdir/usr/bin/notes"
	$pkgdir/usr/bin/notes --help-man > notes.1
	install -Dm644 "notes.1" "$pkgdir/usr/share/man/man1/notes.1"
}
