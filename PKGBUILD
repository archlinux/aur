# Maintainer: robertfoster

pkgname=qviaggiatreno-svn
pkgver=564
pkgrel=2
pkgdesc="Un'applicazione per controllare gli orari dei treni in tutta Italia tramite il sito viaggiatreno.it."
arch=('i686' 'x86_64')
url="http://www.solotreni.net"
license=('GPL2')
depends=('qt5-base' 'qt5-webkit')
source=("qviaggiatreno::git+https://github.com/M0Rf30/qviaggiatreno")

build() {
    cd qviaggiatreno
    qmake
    make
}

package() {
    cd qviaggiatreno
    install -Dm644 qviaggiatreno.desktop $pkgdir/usr/share/applications/qviaggiatreno.desktop
    install -Dm644 src/img/logo.svg $pkgdir/usr/share/pixmaps/qviaggiatreno.svg
    install -Dm755 bin/qviaggiatreno $pkgdir/usr/bin/qviaggiatreno
}

md5sums=('SKIP')
