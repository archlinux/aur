# Contributer: giacomogiorgianni@gmail.com

pkgname=adanaxis-gpl-deb
name=adanaxisgpl
pkgver=1.2.5
pkgrel=4.1
pkgdesc="A deep space first-person shooter game in four spatial dimensions (GPL version)"
arch=('i686' 'x86_64')
url="http://libregamewiki.org/Adanaxis"
license=('GPL')
depends=('gcc' 'libxxf86vm' 'mesa' 'freeglut' 'pcre' 'expat' 'giflib' 'libtiff' 'sdl' 'sdl_mixer' 'alsa-lib' 'esound' 'smpeg' 'libogg' 'libvorbis')
#makedepends=('')

if [ "${CARCH}" = 'x86_64' ]; then
    ARCH='amd64'
    md5sums=('f4fddfaddc3e835b6a61d0ec89218562')
elif [ "${CARCH}" = 'i686' ]; then
    ARCH='i386' 
    md5sums=('4e4d321d3a6660cf4d2cfd184d585793')
fi

source=http://mirror.manitu.net/ubuntu/pool/universe/a/adanaxisgpl/${name}_${pkgver}.dfsg.1-${pkgrel}_${ARCH}.deb

build() {
	cd $srcdir
	ar -x ${startdir}/src/${name}_${pkgver}.dfsg.1-${pkgrel}_${ARCH}.deb
	tar -zxf ${startdir}/src/data.tar.gz
	#cp -r ${startdir}/src/usr/ ${startdir}/pkg/
	#install -d /usr/lib
	#ln -s "/usr/lib/libtiff.so" "${startdir}/pkg/usr/lib/libtiff.so.4"
}

package(){
mv $srcdir/usr $pkgdir
  install -d $pkgdir/usr/lib
   ln -s "/usr/lib/libtiff.so" "${pkgdir}/usr/lib/libtiff.so.4" 
}

