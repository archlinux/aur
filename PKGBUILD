# Maintainer: M0Rf30
 
pkgname=qviaggiatreno-svn
pkgver=559
pkgrel=2
pkgdesc="Un'applicazione per controllare gli orari dei treni in tutta Italia tramite il sito viaggiatreno.it."
arch=('i686' 'x86_64')
url="http://www.solotreni.net"
license=('GPL2')
depends=('qt5-base' 'qt5-webkit')
makedepends=('qtchooser')
source=("qviaggiatreno::svn+http://svn.xp-dev.com/svn/qviaggiatreno/trunk/")
conflicts=(qviaggiatreno)

build() {
  cd qviaggiatreno
  
  qmake || return 1
  make
}

package() {
  cd qviaggiatreno
  install -Dm644 qviaggiatreno.desktop $pkgdir/usr/share/applications/qviaggiatreno.desktop || return 1
  install -Dm755 bin/qviaggiatreno $pkgdir/usr/bin/qviaggiatreno || return 1 
}

pkgver() {
  cd qviaggiatreno
  svnversion | tr -d [A-z]
}

md5sums=('SKIP')
