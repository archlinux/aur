#Maintainer: Frederic Bezies <fredbezies at gmail dot com>
#Contributor:Tutku Dalmaz <tutkudalmaz> 

pkgname=splumber 
pkgver=1.1.0_rc23
pkgrel=2 
pkgdesc="first-person 3d game, not much different to Doom and Quake. Reach the extraction pumps before the water level increases swamping everything." 
arch=('i686' 'x86_64')
url="http://www.triptico.com/splumber/" 
license=('GPL') 
depends=('esound' 'libxext') 
source=("http://triptico.com/download/splumber-1.1.0-rc3.tar.gz") 
md5sums=('fd5d4b026055c9075b932b96e1033d71')

build() { 
	  cd $srcdir/$pkgname-1.1.0-rc3
	    ./config.sh --prefix=/usr 
	      make 
}

package() { 
	cd $srcdir/$pkgname-1.1.0-rc3
	 install -d $pkgdir/usr/{bin,share} 
	 make DESTDIR=$pkgdir install 
}
