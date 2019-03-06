# Maintainer: Karol Babioch <karol@babioch.de

pkgname=btrfs-list-git
_pkgname=${pkgname%-git}
pkgver=r32.182dd9a
pkgrel=1
pkgdesc="A wrapper to btrfs-progs to show a nice overview of your btrfs subvolumes and snapshots, a la 'zfs list'"
arch=('any')
url="https://github.com/speed47/btrfs-list"
license=('GPL2')
depends=('perl' 'btrfs-progs')
makedepends=('git')
source=("$_pkgname::git+https://github.com/speed47/btrfs-list")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${_pkgname}"
    install -Dm755 btrfs-list "${pkgdir}/usr/bin/btrfs-list"
}
