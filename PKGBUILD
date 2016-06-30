# Maintainer: saxonbeta <saxonbeta at gmail>
# Contributor: goten002 <goten002@gmail.com>
# Contributor: epinull

pkgname=mynotex
pkgver=1.4.0.0
pkgrel=1
pkgdesc="A free note-taking and notes manager software for Linux."
url="http://sites.google.com/site/mynotex"
license=('GPL')
arch=('i686' 'x86_64')
depends=('sqlite3' 'gtk2')

if [ "$CARCH" = "i686" ]; then
	debarch=("i386")
        md5sums=('466763d9ffc7170ae2303e9a89a18b5f')
fi

if [ "$CARCH" = "x86_64" ]; then
	debarch=("amd64")
	md5sums=('4b4372f84636a0a4eb6df137f106e065')
fi
source=("https://sites.google.com/site/${pkgname}/files/${pkgname}_${pkgver}_${debarch}.deb")



package() {

  cd "${srcdir}"
  tar -axf data.tar.xz -C "$pkgdir"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/mynotex/mynotex" "${pkgdir}/usr/bin/mynotex"
  
}
