# Maintainer: bashuser30 <bashuser30 at mailbox dot org>
pkgname=dl-distro
pkgver=1.9.1
pkgrel=1
pkgdesc="Download and verify Linux ISOs with GnuPG and shasums"
arch=('any')
url="https://codeberg.org/bashuser30/$pkgname"
source=("$url/archive/v$pkgver.tar.gz")
license=('GPL3')
depends=('bash' 'coreutils' 'jq' 'wget')
optdepends=('gnupg'
            'minisign: Void Linux verification'
            'signify: OpenBSD verification')
sha256sums=('6916746b350050cc070989f757f92c7f0fd34041da7ade2876c573d6a7d0101b')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 distro_data.json "$pkgdir/usr/share/$pkgname/distro_data.json"
}
