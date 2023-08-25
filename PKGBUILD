# Maintainer: codeberge <codeberge at mailbox dot org>
pkgname=dl-distro
pkgver=1.0.2
pkgrel=1
pkgdesc="Download and verify ISOs with GnuPG and shasums"
arch=('any')
url="https://codeberg.org/codeberge/$pkgname"
source=("$url/archive/v$pkgver.tar.gz")
license=('GPL3')
depends=('bash' 'gnupg' 'jq' 'wget')
sha256sums=('d0a0bc7fdb2d83bfb5097595b701256ce5f60821e27376552a4894d8f1e55b0e')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 distro_data.json "$pkgdir/usr/share/$pkgname/distro_data.json"
}
