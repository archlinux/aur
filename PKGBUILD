# Maintainer: Edgar Toll <edjopato@gmail.com>
pkgname=snoopy
pkgver=2017.12.13
pkgrel=1
epoch=
pkgdesc="software tool to design and animate hierarchical graphs, among others Petri nets"
arch=("x86_64")
url="http://www-dssz.informatik.tu-cottbus.de/DSSZ/Software/Snoopy"
license=('custom: non-professional use only')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("snoopy=$pkgver")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-stable-linux-64-${pkgver//./-}.tgz::https://www-dssz.informatik.tu-cottbus.de/track/download.php?id=206"
        "runscript.sh"
        "snoopy.desktop"
        "snoopy.png")
noextract=()
md5sums=('a666a282b03d8baaaeabc917039ba74b'
         'a3c96a349faacd74786db673f2992951'
         'd9e788feb4c1424972a666f58d426f8e'
         '29de8205156262088c576496dd2a44ff')
validpgpkeys=()

package() {
  install -Dm755 "${srcdir}/snoopy2/bin/snoopy" "${pkgdir}/usr/share/${pkgname}/snoopy"
  install -Dm755 "${srcdir}/runscript.sh" "${pkgdir}/usr/bin/snoopy"

  install -d "${pkgdir}/usr/lib/${pkgname}/"
  cp -r "${srcdir}/snoopy2/lib"/* "${pkgdir}/usr/lib/${pkgname}"

  install -Dm644 "${srcdir}/snoopy2/share/help.zip" "${pkgdir}/usr/share/doc/${pkgname}/help.zip"

  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
}
