# Maintainer: CiHO <psychociho@gmail.com>
# Contributor: Backfist <chalvadori@gmx.de>

pkgname=binreader
pkgver=1.0beta3
pkgrel=1
pkgdesc="Simple No-nonsense NZB download manager."
url="http://www.binreader.com/"
license=('custom')
makedepends=()
arch=(i686 x86_64)
depends=('qt4' 'glibc' 'libxdmcp' 'libxcb' 'openssl' 'libpng' 'freetype2' 'libxrender' 'libx11' 'par2cmdline')

if [[ $CARCH == 'x86_64' ]];
then
	
source=(https://web.archive.org/web/20140122123931/http://www.binreader.com/${pkgname}_${pkgver}_amd64.deb)
	md5sums=('cf0351ca215aa40a24001c4faefcda3b');
else
	source=(https://web.archive.org/web/20140122123931/http://www.binreader.com/${pkgname}_${pkgver}_i386.deb)
	md5sums=('1563486ebedbb3959711d6f2a339f567');
fi

optdepends=()

package() {
 if [[ $CARCH == 'x86_64' ]];
 then
	ar p ${srcdir}/${pkgname}_${pkgver}_amd64.deb data.tar.gz | tar xz
 else
	ar p ${srcdir}/${pkgname}_${pkgver}_i386.deb data.tar.gz | tar xz
 fi
  
  cp -R ${srcdir}/usr ${pkgdir}/
}
