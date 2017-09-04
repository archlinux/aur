# Contributors:
# henning mueller <henning@orgizm.net>
# krompus <amartin@riseup.net>

pkgname=anarchism
pkgver=15.0
pkgrel=1
_debpkgrel=2
pkgdesc='Source of information regarding Anarchist (libertarian socialist) theory and practice.'
arch=(any)
license=(FDL)
url=http://www.infoshop.org/AnAnarchistFAQ
options=(docs)
depends=(xdg-utils)
source=(
  http://ftp.debian.org/debian/pool/main/a/$pkgname/$pkgname\_$pkgver-$_debpkgrel\_all.deb
  anarchism.desktop
  anarchism.png
  anarchism.svg
)

build() {
  cd $srcdir
  ar x $(basename $source)
  tar xf data.tar.xz
}

package() {
  cd $srcdir
  cp -r usr $pkgdir
  mkdir -p $pkgdir/usr/share/{applications,pixmaps}
  cp $pkgname.png $pkgdir/usr/share/pixmaps
  cp $pkgname.desktop $pkgdir/usr/share/applications
}

sha256sums=('b326b2a666c2b13dcdad188884a4337891677fd67186e8d29313d09c37bd2476'
            'fc5cc0c2918037bdbebb16b27de5e847e5041c6e50fe37ef073b501446221521'
            '81f90b8985679d1a9741cf21a4908cbb12d3fe3d67dabb7af0b77e73c1c16744'
            '66fbad2b8a849e1a643f98dac50095b8ab5ddf0256f407c2c629aa5ef5e17e62')
