# Maintainer: Emile Pesik <emile [at] aerion [dot] co [dot] uk> 
pkgname=rephrase
pkgver=0.1
pkgrel=1 
pkgdesc="A specialized passphrase recovery tool for GnuPG." 
arch=(any) 
url="http://www.roguedaemon.net/rephrase/" 
license=("GPL")
depends=('gnupg')
source=("http://www.roguedaemon.net/${pkgname}/${pkgname}-${pkgver}.tar.gz") 
md5sums=('be53cd4988efa1a226f3dc15decf12a9')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  make GPG=/usr/bin/gpg
  }
	
package() {
  cd $srcdir/${pkgname}-${pkgver}
  make BINDIR="${pkgdir}/usr/bin" DESTDIR="${pkgdir}" install
  }
