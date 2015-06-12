# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=ksar_bin
pkgver=5.0.6
pkgrel=4
pkgdesc="a sar grapher written in java"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ksar/"
license=("BSD")
depends=('java-runtime')
source=("http://sourceforge.net/projects/ksar/files/ksar/${pkgver}/kSar-${pkgver}.zip" "kSar.desktop")
md5sums=('f887da3ab710db037a970d9f0b9f053c'
         '21d3cf5f5e953605cf2d49c83c705ee7')

build() {
true
}

package() {
cd $srcdir/kSar-${pkgver}
mkdir -p $pkgdir/usr/share/kSar/{contrib,docs,lib,} $pkgdir/usr/bin
install -D -m644 contrib/* $pkgdir/usr/share/kSar/contrib
install -D -m644 docs/* $pkgdir/usr/share/kSar/docs
install -D -m644 lib/* $pkgdir/usr/share/kSar/lib
install -D -m644 LICENCE $pkgdir/usr/share/kSar/LICENCE
install -D -m644 kSar.jar $pkgdir/usr/share/kSar/kSar.jar
install -D -m644 kSar.jnlp $pkgdir/usr/share/kSar/kSar.jnlp
sed -i "/^DIRNAME=/s/.*/DIRNAME=\/usr\/share\/kSar/" run.sh
install -D -m755 run.sh $pkgdir/usr/share/kSar/run.sh
ln -s /usr/share/kSar/run.sh $pkgdir/usr/bin/kSar
install -D -m644 $srcdir/kSar.desktop $pkgdir/usr/share/applications/kSar.desktop
}
