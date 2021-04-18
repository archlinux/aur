# Maintainer: EdJoPaTo <snoopy-aur@edjopato.de>
pkgname=snoopy
pkgver=2019.12.20
pkgrel=3
epoch=
pkgdesc="software tool to design and animate hierarchical graphs, among others Petri nets"
arch=("x86_64")
url="http://www-dssz.informatik.tu-cottbus.de/DSSZ/Software/Snoopy"
license=('custom: non-professional use only')
groups=()
depends=('gtk2'
         'libpng12'
         'libsm'
         'libxtst'
         'libxxf86vm')
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
source=("$pkgname-stable-linux-64-${pkgver//./-}.tgz::https://www-dssz.informatik.tu-cottbus.de/track/download.php?id=246"
        "runscript.sh"
        "snoopy.desktop"
        "snoopy.png")
noextract=()
md5sums=('a01423e1791727465d0fd268deae298b'
         '79bb5f35fc34fe7259b0369d8cf9f7ee'
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
