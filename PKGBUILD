# Maintainer: Caleb Maclennan <caleb@alerque.com>
#
# Any suggestions welcome; please submit paches via Github:
# https://github.com/alerque/aur/tree/master/diradm-git

pkgname=diradm-git
pkgver=1.3_1_gf4b32ed
pkgrel=3
_branch=devel
pkgdesc='A simple bash script for managing posix users and groups stored in a LDAP directory'
arch=('any')
url="https://github.com/alerque/${pkgname%-git}"
license=('GPL2')
depends=('openldap')
makedepends=('git')
conflicts=("${pkgname%-git}")
backup=('etc/diradm.conf')
source=("git+$url.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/-/_/g'
}

package() {
    cd "${pkgname%-git}"
    install -Dm755 -t "$pkgdir/usr/bin/" diradm
    install -Dm644 -t "$pkgdir/etc/" diradm.conf
}
