# Maintainer: Joost Molenaar <jjm@j0057.nl>
pkgname=cni-plugin-dnsname
pkgver=1.1.1
pkgrel=1
epoch=
pkgdesc="name resolution for containers"
arch=(x86_64)
url="https://github.com/containers/dnsname"
license=('Apache')
groups=()
depends=(glibc)
makedepends=(make go)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/containers/dnsname/archive/v1.1.1.tar.gz")
noextract=()
sha256sums=('e8c7b0d4bab5d2559e50fe4a9947f2addd28cdaddd6b2909cddc350c85761f41')
validpgpkeys=()

build() {
    cd "dnsname-$pkgver"
    make
}

package() {
    install -o root -g root -m 755 -d $pkgdir/usr/lib/cni
    install -o root -g root -m 755 -t $pkgdir/usr/lib/cni dnsname-$pkgver/bin/dnsname
}
