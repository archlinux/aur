# Maintainer : anergy <anergy dot 25110321 at gmail dot com>
# Contributor(previous maintainer) : smly <eowner at gmail dot com> 
# Contributor : muflax <muflax at gmail dot com>

pkgname=mplus-font
pkgver=2.2.4
pkgrel=2
pkgdesc="M+ Japanese bitmap fonts"
arch=(any)
license=('custom')
depends=('xorg-xset')
makedepends=('xorg-bdftopcf')
install="$pkgname.install"
url="http://mplus-fonts.sourceforge.jp/"
source=("http://osdn.dl.sourceforge.jp/mplus-fonts/5030/mplus_bitmap_fonts-${pkgver}.tar.gz")
md5sums=('a97a99acbee54976407dec828d03850c')

build() {
    return 0
}

package() {
  cd $srcdir/mplus_bitmap_fonts-$pkgver

  DESTDIR=$pkgdir/usr/share/fonts/mplus ./install_mplus_fonts || return 1
  mkdir -p $pkgdir/usr/share/licenses/custom/${pkgname}
  install -m644 LICENSE_E $pkgdir/usr/share/licenses/custom/${pkgname}/license.txt
}
