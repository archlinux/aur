# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=cellware
pkgver=3.0.1
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc="Cellware is design environment and simulation engine for metabolic pathways"
arch=('i686' 'x86_64')
url="http://www.bii.a-star.edu.sg/achievements/applications/cellware/"
license=('custom')
depends=('java-runtime')
source=("http://www.bii.a-star.edu.sg/docs/sbg/cellware/cellware_$_pkgver.tar.gz" starter.sh)
noextract=("cellware_$_pkgver.tar.gz")
md5sums=('9ab7ec149136ed3789ce7af939f05078'
         'c8f9fc6beb32ffd0b1ab3202202385a6')

package() {
  mkdir -p "$pkgdir/usr/"{bin,share/java/cellware}

  tar --strip-components 1 \
      -C "$pkgdir/usr/share/java/cellware" \
      -xzvf cellware_$_pkgver.tar.gz

  cd "$pkgdir/usr/share/java/cellware"
  rm cellware.bat
  chmod +x cellware.sh
  install -Dm755 "$srcdir/starter.sh" "$pkgdir/usr/bin/cellware"
}
