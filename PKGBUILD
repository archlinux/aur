# Maintainer: Robert Sprunk <archlinux@sprunk.me>

pkgname=madsonic6
pkgver=6.2.9080
pkgvera=6.2
pkgdate=20161222
pkgrel=1
pkgdesc="Madsonic Mashup Mod is a fork of the Subsonic Server Build with some Subsonic Data schema modifications! This is the latest stable version.:"
arch=('i686' 'x86_64')
url="http://madsonic.org/"
license=('GPL')
depends=('java-runtime-headless' 'fontconfig' 'libcups')
optdepends=('ffmpeg: Audio Transcoding')


source=(http://madsonic.org/download/${pkgvera}/${pkgdate}_madsonic-${pkgver}-standalone.tar.gz
'madsonic6.service')

sha256sums=('a92968d4338ac1f3e89adc07bc8796b03fb4ca0acf986bfb39d298b4afe2d42a'
	 'e2a088a5207175e6e91470ba8e5a7db44ef98b6a5936d1e17b8f20013b99f926')

backup=('var/madsonic6/db' 'var/madsonic6/madsonic.sh')
install=$pkgname.install
#changelog=CHANGELOG
 
package() {
  cd ${srcdir}
  mkdir -p $pkgdir/var/madsonic6
  install -m 755 -t $pkgdir/var/madsonic6 $srcdir/{madsonic.sh,madsonic.war,madsonic-booter.jar,version.txt}
  install -m 644 -t $pkgdir/var/madsonic6 $srcdir/license.txt
  mkdir -p $pkgdir/usr/lib/systemd/system
  install -m 644 -t $pkgdir/usr/lib/systemd/system $srcdir/madsonic6.service
}

