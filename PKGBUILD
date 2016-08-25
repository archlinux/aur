# Maintainer: Ioannis Angelakopoulos <ioagel@gmail.com>
pkgname=glassfish-web-v4
pkgver=4.1.1
pkgrel=1
pkgdesc="Glassfish 4 - Java EE 7 Web Profile edition"
arch=("any")
url="https://glassfish.java.net/"
license=("CDDL")
depends=("java-environment>=7")
provides=("glassfish")
conflicts=("glassfish")
options=(!strip)
install=$pkgname.install
source=(
  http://download.java.net/glassfish/${pkgver}/release/glassfish-${pkgver}-web.zip
  glassfish-web.service
)
md5sums=('44baeca38cf33bb655fd3dd09f7d2b78'
         '6d90ad02652b935bb14585893e6be241')

package() {
  mkdir -p $pkgdir/opt
  mv glassfish4 $pkgdir/opt/glassfish4-web
  install -D $srcdir/glassfish-web.service $pkgdir/usr/lib/systemd/system/glassfish-web.service
}

