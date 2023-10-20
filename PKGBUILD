# Maintainer: bashuser30 <bashuser30 at mailbox dot org>
pkgname=dl-distro-git
_pkgname=dl-distro
pkgver=144.3163f4e
pkgrel=1
pkgdesc="Download and verify ISOs with GnuPG and shasums (git version)"
arch=('any')
url="https://codeberg.org/bashuser30/$_pkgname"
source=("git+$url")
license=('GPL3')
depends=('bash' 'gnupg' 'jq' 'wget')
optdepends=('minisign: void signature verification')
makedepends=('git')
conflicts=('dl-distro')
provides=('dl-distro')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 distro_data.json "$pkgdir/usr/share/$_pkgname/distro_data.json"
}
