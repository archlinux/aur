# Maintainer: Colin Reeder <vpzomtrrfrt@gmail.com>
pkgname=wunderlistux-bin
pkgver=0.0.9
pkgrel=1
pkgdesc="An electron wrapper for wunderlist made with ❤️ for Linux (specially for elementary OS)"
url="https://github.com/edipox/wunderlistux"
arch=('x86_64')

sha256sums=('9ed0a61468e42e30ac750d606c28e7e63057d85ac21ce99117c39ff1222b023e')

source=("$url/releases/download/v$pkgver-linux-x64/Wunderlistux-linux-x64.tar.gz")

package() {
    mkdir -p $pkgdir/opt/$pkgname
    mkdir -p $pkgdir/usr/share/applications
    cp -r $srcdir/Wunderlistux-linux-x64/* $pkgdir/opt/$pkgname
    sed "s/path\/to\/Wunderlistux-linux-x64/opt\/$pkgname/g" $srcdir/Wunderlistux-linux-x64/resources/app/wunderlistux.desktop > $pkgdir/usr/share/applications/$pkgname.desktop
}
