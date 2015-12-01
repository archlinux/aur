# Maintainer: Gonzalo Ciruelos <gonzalo.ciruelos@gmail.com> 

pkgname=qriollo
binname=qr
pkgver=0.91
pkgrel=13
install=.INSTALL
pkgdesc="El lenguaje más boludo del mundo"
arch=('i686' 'x86_64')
url="http://qriollo.github.io"
makedepends=('git' 'ghc')
source=('qriollo::git+https://github.com/qriollo/qriollo.git')
md5sums=('SKIP')


build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    install -Dm755 $binname "$pkgdir/usr/bin/$binname"
    install -Dm666 Chamuyo.q "$pkgdir/usr/share/qriollo/Chamuyo.q"

    echo "export RUTA_QRIOLLO=".:/usr/share/qriollo"" > qriollo.sh
    install qriollo.sh -Dm755 $pkgdir/etc/profile.d/qriollo.sh
}
