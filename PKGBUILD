# Maintainer: Benjamin Bädorf <aur at benjaminbaedorf dot eu>
# Maintainer: Siddarth Dushantha <siddarth dot dushanta at gmail dot com>

pkgname=tmpmail-git
_pkgname=tmpmail
pkgver=72.gf32c7ee
pkgrel=1
pkgdesc="A temporary email right from your terminal"
arch=('any')
url="https://github.com/sdushantha/tmpmail"
license=('MIT')
makedepends=('git')
depends=('w3m' 'curl' 'jq')
provides=()
conflicts=()
source=("$_pkgname::git+https://github.com/sdushantha/tmpmail.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    echo "$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    chmod +x ./tmpmail
    mkdir -p "$pkgdir/usr/bin"
    cp ./tmpmail "$pkgdir/usr/bin"
}
