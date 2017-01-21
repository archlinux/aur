# Contributor: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Ludovico de Nittis <aasonykk [at] gmail [dot] com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=dbmain
pkgver=10.0.1
pkgrel=1
pkgdesc="A free data-modeling and data-architecture tool"
arch=(i686 x86_64)
url=http://www.db-main.eu/
license=(custom)
depends=(java-runtime libsm libx11 cairo expat gcc-libs gtk2 gdk-pixbuf2 glib2 pango libpng12 zlib)
source_i686=("http://www.rever.eu/db-main/files/dbm-${pkgver//.}-linux-i386-setup.tar.gz")
source_x86_64=("http://www.rever.eu/db-main/files/dbm-${pkgver//.}-linux-amd64-setup.tar.gz")
source=(${pkgname}.sh
        ${pkgname}.desktop
        ${pkgname}.png)
md5sums=('b39e20bbd5360fd70b7b23f0f69689d4'
         '048f1f5f6fe6e5b29d8e7cbeb825103d'
         '6bb248b5807368118996f3f5ad2edb68')
md5sums_i686=('7d3365af0cfe9cd16d2d5e77a24bda62')
md5sums_x86_64=('13175bef81eacd8d709ae33fe70cffbd')

package(){
  cd "${srcdir}"

  # Actual program
  install -d "${pkgdir}/opt/dbmain/"
  cp -r bin doc examples java plugins License.txt readme.html "${pkgdir}/opt/dbmain/"

  # Launch script
  install -d "${pkgdir}/usr/bin/"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -m755 dbmain.sh "${pkgdir}/usr/bin/dbmain"

  # LICENSE file
  install -Dm644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
