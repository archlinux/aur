# Maintainer: codeberge <codeberge at mailbox dot org>
pkgname=dl-distro-git
_pkgname=dl-distro
pkgver=13.1d7fb30
pkgrel=1
pkgdesc="Download and verify ISOs with GnuPG and shasums"
arch=('any')
url="https://codeberg.org/codeberge/$_pkgname"
source=("git+$url")
license=('GPL3')
depends=('bash' 'gnupg' 'wget')
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
}
