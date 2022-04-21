# Maintainer: Matt C <mdc028[at]bucknell[dot]edu>
# Developer: axtlos <axtlos[at]salyut[dot]one>
# Developer: jnats <jnats[at]salyut[dot]one>

pkgname=ame
pkgver=3.0.1
pkgrel=1
pkgdesc="Fast, efficient and lightweight AUR helper/pacman wrapper"
arch=('any')
url="https://git.tar.black/crystal/ame"
license=('Nolicense')
source=("git+https://git.tar.black/crystal/ame")
sha256sums=('SKIP')
depends=('git' 'binutils' 'fakeroot')
makedepends=('cargo' 'make')
conflicts=('ame')

build() {
    cd ${srcdir}/ame
    cargo build --release --all-features
}

package() {
    mkdir -p $pkgdir/usr/bin
    chmod +x ${srcdir}/ame/target/release/{ame,apt,apt-get,dnf,eopkg,yum,zypper}
    cp ${srcdir}/ame/target/release/{ame,apt,apt-get,dnf,eopkg,yum,zypper}  $pkgdir/usr/bin/.
}
