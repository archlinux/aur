# Contributor: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Ludovico de Nittis <aasonykk [at] gmail [dot] com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=dbmain
pkgver=11.0.2
pkgrel=0
pkgdesc="A free data-modeling and data-architecture tool"
arch=(i686 x86_64)
url=https://www.db-main.eu/
license=(custom)
depends=(java-runtime libsm libx11 cairo expat gcc-libs gtk2 gdk-pixbuf2 glib2 pango libpng12 zlib)
source_x86_64=("https://projects.info.unamur.be/dbmain/files/dbm-1102-linux-amd64-setup.tar.gz")
source=(${pkgname}.sh
        ${pkgname}.desktop
        ${pkgname}.png)
md5sums=('b39e20bbd5360fd70b7b23f0f69689d4'
         '048f1f5f6fe6e5b29d8e7cbeb825103d'
         '6bb248b5807368118996f3f5ad2edb68')
sha256sums_x86_64=('8f61e6069337dc734ac6f886b224329ec943cd4dafbd888611bd806373cb3296')

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
