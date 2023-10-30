# Maintainer: bashuser30 <bashuser30 at mailbox dot org>
pkgname=dl-distro-git
_pkgname=dl-distro
pkgver=197.8de119f
pkgrel=1
pkgdesc="Bash script for downloading and verifying OS images."
arch=('any')
url="https://codeberg.org/bashuser30/$_pkgname"
source=("git+$url")
license=('GPL3')
depends=('bash' 'coreutils' 'jq' 'wget')
optdepends=('gnupg'
            'minisign: Void Linux verification'
            'signify: OpenBSD verification')
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
