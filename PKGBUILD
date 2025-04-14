# Maintainer: bashuser30 <bashuser30@mailbox.org>
pkgname=dl-distro
pkgver=2.3.3
pkgrel=1
pkgdesc="Bash script for downloading and verifying OS images."
arch=('any')
url="https://codeberg.org/bashuser30/$pkgname"
license=('GPL-3.0-or-later')
depends=('bash'
         'coreutils'
         'jq'
         'wget')
optdepends=('gnupg'
            'minisign: Void Linux verification'
            'signify: OpenBSD verification')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('0d6e133ba57c7a78c5199040af467e95dbb7a66c955495cce599669456d68e47')

package() {
	cd "$srcdir/$pkgname"

	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "man/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
	install -Dm644 "completions/bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
}
