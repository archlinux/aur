# Maintainer: <kaptoxic _at_ yahoo _dot_ com >
# Contributor: Ricardo Funke Ormieres <ricardo DOT funke at gmail DOT com>

pkgname=pomodairo
pkgver=1.9
pkgrel=1
pkgdesc="An Adobe Air application for working with the Pomodoro technique"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pomodairo/"
license=('custom')
depends=('adobe-air')
makedepends=('unzip')
source=("http://pomodairo.googlecode.com/files/pomodairo-${pkgver}.air")
md5sums=('9f6ae328f4958e9b1afe20dbc46be5ea')
noextract=${pkgname}-${pkgver}.air

package()
{
   cd ${srcdir}
   mkdir -p ${pkgdir}/opt/$pkgname
   unzip ${pkgname}-${pkgver}.air -d ${srcdir}

   echo "[Desktop Entry]" >> ${srcdir}/${pkgname}.desktop
   echo "Categories=Office;ProjectManagement;" >> ${srcdir}/${pkgname}.desktop
   echo "Comment=$pkgdesc" >> ${srcdir}/${pkgname}.desktop
   echo "Encoding=UTF-8" >> ${srcdir}/${pkgname}.desktop
   echo "Exec=adobe-air /opt/${pkgname}/${pkgname}.air" >> ${srcdir}/${pkgname}.desktop
   echo "GenericName=$pkgname" >> ${srcdir}/${pkgname}.desktop
   echo "Hidden=false" >> ${srcdir}/${pkgname}.desktop
   echo "Icon=${pkgname}.png" >> ${srcdir}/${pkgname}.desktop
   echo "MimeType=application/vnd.adobe.air-application-installer-package+zip" >> ${srcdir}/${pkgname}.desktop
   echo "Name=$pkgname" >> ${srcdir}/${pkgname}.desktop
   echo "Terminal=false" >> ${srcdir}/${pkgname}.desktop
   echo "Type=Application" >> ${srcdir}/${pkgname}.desktop

   install -m644 -D ${srcdir}/assets/clock-48x48.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
   install -m644 -D ${srcdir}/${pkgname}-${pkgver}.air ${pkgdir}/opt/${pkgname}/${pkgname}.air
   install -m644 -D ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
