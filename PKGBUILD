# Maintainer: lucas <lucas.bmior@gmail.com>

pkgname=systemd-boot-btrfs-snapshots-git
pkgver=r43.f7eef68
pkgrel=1
pkgdesc="Btrfs snapshot scripts with systemd-boot integration"
arch=(x86_64)
url="https://github.com/lucas-mior/systemd-boot-btrfs-snapshots"
license=(AGPL)
depends=()
makedepends=(git)
provides=("systemd-boot-btrfs-snapshots")
conflicts=()
source=("git+https://github.com/lucas-mior/systemd-boot-btrfs-snapshots.git")
md5sums=('SKIP')  # git sources are variable, skip checksum
install="PKGBUILD.install"

pkgver() {
    cd "$srcdir/${pkgname%-git}" || exit 1
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}" || exit 1
    export DESTDIR="$pkgdir"
    export PREFIX="/usr"
    ./build.sh install
}
