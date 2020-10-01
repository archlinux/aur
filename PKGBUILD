# Maintainer: Stephanie Hobbs (RX14) <steph@rx14.co.uk>

pkgname=rclonesync-git
pkgver=3.1.r2.g5971851
pkgrel=1
pkgdesc="A Bidirectional Cloud Sync Utility using rclone"
arch=("any")
url="https://github.com/cjnaz/rclonesync-V2"
license=("MIT")
depends=("python" "rclone")
makedepends=("git")
source=("rclonesync::git+${url}")
sha256sums=('SKIP')
            
pkgver() {
    cd rclonesync

    git describe --long --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd rclonesync

    install -m 0755 -d "$pkgdir"/usr/bin
    install -m 0755 rclonesync "$pkgdir"/usr/bin/rclonesync
}
