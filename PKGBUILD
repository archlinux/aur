# Maintainer: Joost Molenaar <jjm@j0057.nl>
pkgname=cni-plugin-dnsname
pkgver=0.0
pkgrel=1
pkgcommit=2e1d2e0732df49df460e0991f68bf2ccfcd102db
epoch=0
pkgdesc="name resolution for containers"
arch=(x86_64)
url="https://github.com/containers/dnsname"
license=('Apache')
groups=()
depends=()
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
source=("https://github.com/containers/dnsname/archive/$pkgcommit.zip")
noextract=()
sha256sums=("76386cbed1a540c700e28b8cb2dcda083118a9c10fea2bb85f06a4f59a081b64")
validpgpkeys=()

build() {
    cd "dnsname-$pkgcommit"
	make
}

package() {
    install -o root -g root -m 644 -d $pkgdir/usr/lib/cni
    install -o root -g root -m 755 -t $pkgdir/usr/lib/cni dnsname-$pkgcommit/bin/dnsname
}
