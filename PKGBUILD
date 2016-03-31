# Maintainer: Stefan Tatschner <rumpelsepp@sevenbyte.org>

pkgname='snap'
pkgver=0.1.0
pkgrel=1
pkgdesc="A btrfs snapshot manager"
arch=('any')
url="https://github.com/rumpelsepp/snap"
license=('MIT')
depends=('btrfs-progs' 'ruby')
makedepends=('git')
source=("$pkgname::git+https://github.com/rumpelsepp/snap.git#commit=cd0c39d5d4813edc6c36db73b24c5f98a231d50b")
sha256sums=('SKIP')

#build() {
#    cd "${srcdir}/${pkgname}/man"
#    make man
#}

package() {
    cd "${srcdir}/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/snap"
#    install -d "${pkgdir}/usr/share/man/man1"
    install -m 755 snap "${pkgdir}/usr/bin/snap"
    install -m 755 snap-init "${pkgdir}/usr/bin/snap-init"
    install -m 755 snap-create "${pkgdir}/usr/bin/snap-create"
    install -m 755 snap-prune "${pkgdir}/usr/bin/snap-prune"
    install -m 755 snap-list "${pkgdir}/usr/bin/snap-list"
    install -m 644 etc/* "${pkgdir}/usr/share/snap"
}
