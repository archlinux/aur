# Maintainer: Joost Molenaar <jjm@j0057.nl>

pkgname=fluent-bit

pkgmaj=0.13
pkgver=$pkgmaj.7
pkgrel=2
epoch=

pkgdesc='Collect data/logs from different sources, unify and send them to multiple destinations.'
arch=(x86_64)
url='https://fluentbit.io/'
license=('Apache')
groups=()

depends=()
makedepends=(cmake)
checkdepends=()
optdepends=()

provides=()
conflicts=()
replaces=()

backup=('etc/fluent-bit/fluent-bit.conf'
        'etc/fluent-bit/parsers.conf')
options=()
install=
changelog=
source=("https://fluentbit.io/releases/$pkgmaj/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=(9c592bda1ba6fcee2d62f0e2737ab71d)
validpgpkeys=()

build() {
    cd $pkgname-$pkgver/build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_SYSCONFDIR=/etc ..
    make -j8
}

package() {
    cd $pkgname-$pkgver/build
    make DESTDIR="$pkgdir/" install
}
