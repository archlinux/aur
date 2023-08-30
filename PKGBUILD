# Maintainer: codeberge <codeberge at mailbox dot org>
pkgname=dl-distro
pkgver=1.1.0
pkgrel=1
pkgdesc="Download and verify ISOs with GnuPG and shasums"
arch=('any')
url="https://codeberg.org/codeberge/$pkgname"
source=("$url/archive/v$pkgver.tar.gz")
license=('GPL3')
depends=('bash' 'gnupg' 'jq' 'wget')
sha256sums=('f2570f8926ae891ab9623153f7eca11cc2cfa16f2ac77eafb28a1e10dcfd3db6')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 distro_data.json "$pkgdir/usr/share/$pkgname/distro_data.json"
}
