# Maintainer: bashuser30 <bashuser30 at mailbox dot org>
pkgname=dl-distro
pkgver=1.8.1
pkgrel=1
pkgdesc="Download and verify Linux ISOs with GnuPG and shasums"
arch=('any')
url="https://codeberg.org/bashuser30/$pkgname"
source=("$url/archive/v$pkgver.tar.gz")
license=('GPL3')
depends=('bash' 'coreutils' 'jq' 'wget')
optdepends=('gnupg'
            'minisign: Void Linux verification')
sha256sums=('bad7318af2c2e99b4577acf4200847f8cd61ba13e5d497ed79b7ac5775fe78dc')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 distro_data.json "$pkgdir/usr/share/$pkgname/distro_data.json"
}
