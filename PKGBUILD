# Maintainer: Ilya Kovalenko <agentsib@gmail.com>

pkgname=joxi
pkgver=2.4.0
pkgrel=2
pkgdesc="Easy to use screenshot sharing application (Russian)"
arch=('i386' 'x86_64')
url="http://joxi.ru/"
license=('unknown')
options=('emptydirs')
depends=('qt4' 'libpng12' 'quazip' 'opencv')

if [ "${CARCH}" = 'x86_64' ]; then
  ARCH='amd64'
  md5sums=(
			'9be5f0051b4d2c8ae0669115ccb74d17'
			'66ef866e3fe32bbfd9eb72fe5ce02b7e'
		  )

elif [ "${CARCH}" = 'i686' ]; then
  ARCH='i386'
  md5sums=(
            '3606c1987b4707499ece7cf5d915358d'
			'66ef866e3fe32bbfd9eb72fe5ce02b7e'
          )
fi

source=("http://bc.cdn.joxi.ru/download/${pkgname}_${ARCH}.deb" "${pkgname}.desktop")
package(){
   ar -x "${srcdir}/${pkgname}_${ARCH}.deb"
   tar -zxf "${srcdir}/data.tar.gz"
   
   install -D -m755 "${srcdir}/usr/bin/joxi" "${pkgdir}/usr/bin/joxi"

   install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
   install -D -m644 "${srcdir}/opt/joxi/icon_64.png" "${pkgdir}/usr/share/pixmaps/joxi.png"
   install -D -m644 "${srcdir}/usr/share/doc/joxi/doc/analytics/protocol" "${pkgdir}/usr/share/doc/joxi/doc/analytics/protocol"
}
