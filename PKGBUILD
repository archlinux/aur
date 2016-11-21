# Contributor: Imanol Celaya <ilcra1989@gmail.com>
# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=4l
pkgver=1.0r6
_realname=4L-1.0-r6
pkgrel=8
pkgdesc="4L: LaCie LightScribe Labeler for Linux"
arch=('i686')
url="http://www.lacie.com/products/product.htm?pid=10803"
license=('unknown')
install=4l.install
depends=('gcc-libs' 'libxi' 'fontconfig' 'libxinerama' 'libxcursor' 'libxrandr' 'lightscribe')
#source=(http://www.lacie.com/download/drivers/$_realname.i586.rpm)
source=($_realname.i586.rpm::http://www.lacie.com/files/lacie-content/download/drivers/LaCie%20LightScribe%20Labeler%201.0%20Linux.rpm)
md5sums=('11fc8b2daeaed2b61a567056413bdefd')

package() {
  cd $srcdir
  mkdir -p $pkgdir/{opt,usr/bin}
  cp -R usr/4L $pkgdir/opt
  ln -s /opt/4L/4L-cli ${pkgdir}/usr/bin/4L-cli
  ln -s /opt/4L/4L-gui ${pkgdir}/usr/bin/4L-gui
  find $pkgdir/opt -type d -exec chmod 755 {} \;
  chmod -x $pkgdir/opt/4L/*/*
  chmod +s $pkgdir/opt/4L/4L-cli
}
