# Contributor: goten002 <goten002@gmail.com>
# Contributor: epinull
# Maintainer: saxonbeta <saxonbeta at gmail>
pkgname=mynotex
pkgver=1.3.1.1
pkgrel=1
pkgdesc="A free note-taking and notes manager software for Linux."
url="http://sites.google.com/site/mynotex"
license=('GPL')
arch=('i686' 'x86_64')
depends=('sqlite3' 'gtk2')

if [ "$CARCH" = "i686" ]; then
	debarch=("i386")
        md5sums=('628c9499bb6f19c4b1375aef67a724d7')
fi

if [ "$CARCH" = "x86_64" ]; then
	debarch=("amd64")
	md5sums=('fb908f8272991378ce8321c51462fc63')
fi
source=("https://sites.google.com/site/mynotex/files/mynotex_${pkgver}_${debarch}.deb")

package() {

  cd "${srcdir}"
  tar -axf data.tar.xz -C "$pkgdir"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/mynotex/mynotex" "${pkgdir}/usr/bin/mynotex"
  
}
