# Maintainer: bashuser30 <bashuser30@mailbox.org>
pkgname=dl-distro
pkgver=2.0.3
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
sha256sums=('d869cf45c3c80dce723b6360543e8cd47283e8b333b17817c60cc4c9bf156dd9')

package() {
	cd "$srcdir/$pkgname"

	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "man/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
	install -Dm644 "completions/bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
}
