# Maintainer: xeyqe <xeyqe@seznam.cz>

pkgname=swar-red
pkgver=1
pkgrel=0
pkgdesc="A dark red gtk theme."
arch=('any')
url="http://NoobsLab.com"
license=('GPL')
depends=('gtk-engine-murrine' 'gnome-themes-standard' 'gtk-engines')
makedepends=('perl')
source=("http://ppa.launchpad.net/noobslab/swar-themes/ubuntu/pool/main/s/swar-red/${pkgname}_${pkgver}-${pkgrel}~precise.tar.gz")
md5sums=('5ba2e7cf2868bd6083c50c7827a6c273')

prepare() {
	perl -pi -e 's/4C4C4C/000000/g' swar-red/swar-red/gtk-2.0/gtkrc
	perl -pi -e 's/#bg_pixmap/bg_pixmap/g' swar-red/swar-red/gtk-2.0/gtkrc
}

package() {
  cd ${pkgname}
  find swar-red/ -type f \
      -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
}
