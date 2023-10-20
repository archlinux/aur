# Maintainer: bashuser30 <bashuser30 at mailbox dot org>
pkgname=dl-distro
pkgver=1.7.0
pkgrel=2
pkgdesc="Download and verify ISOs with GnuPG and shasums"
arch=('any')
url="https://codeberg.org/bashuser30/$pkgname"
source=("$url/archive/v$pkgver.tar.gz")
license=('GPL3')
depends=('bash' 'jq' 'wget')
optdepends=('gnupg: use -n to disable verification'
            'minisign: void signature verification')
sha256sums=('3e4164ee3ffb69d8673bc971b6f97d82a056f0adc338abcc5bc261d88bcf9bde')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 distro_data.json "$pkgdir/usr/share/$pkgname/distro_data.json"
}
