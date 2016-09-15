# Maintainer: M0Rf30

pkgname=iortcw-data
pkgver=1.42d
pkgrel=1
pkgdesc="Return to Castle Wolfenstein Single Player pk3s files (shared use)"
arch=('any')
url="ftp://ftp.internat.freebsd.org/pub/FreeBSD/distfiles/"
license=('GPL')
install='iortcw-data.install'
depends=('wolf-data')
source=("https://github.com/iortcw/iortcw/releases/download/$pkgver/patch-data-141.zip")

package() {

    cd $srcdir/main
  # Clean unneeded files    
    rm *.so *.dll
  
  # Move Data to Package Directory
    mkdir -p $pkgdir/opt/iortcw-data
    cp -r * $pkgdir/opt/iortcw-data/

  # Symlinking content from wolf-data package
  ln -s -r /opt/wolf-data/sp_pak2.pk3	$pkgdir/opt/iortcw-data/
  ln -s -r /opt/wolf-data/mp_pak1.pk3   $pkgdir/opt/iortcw-data/
  ln -s -r /opt/wolf-data/mp_pak2.pk3   $pkgdir/opt/iortcw-data/
}

md5sums=('d4888a63b2b473ef82b7df850bc07d64')
