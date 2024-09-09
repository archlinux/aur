# Maintainer: Omansh Krishn omansh@duck.com

pkgname=bloomeetunes-bin
_pkgname=bloomeetunes
_ver=2.9.9
pkgver=${_ver}+138
_relver=${_ver}_dev+16
pkgrel=1
pkgdesc='🌸Bloomee is a cross-platform music app designed to bring you ad-free tunes from various sources. 🌼🎵'
arch=('x86_64')
url='https://github.com/HemantKArya/BloomeeTunes'
license=('GPL2')
depends=('gtk3' 'pango' 'harfbuzz' 'at-spi2-core' 'cairo' 'gdk-pixbuf2' 'glib2' 'gcc-libs')
provides=('bloomeetunes')
conflicts=('bloomeetunes-git')
options=(!debug)


source=("https://github.com/HemantKArya/BloomeeTunes/releases/download/v${pkgver}/bloomee_tunes_linux_v${_relver}.zip"
        "$_pkgname.desktop")

sha512sums=('d7746a13a3a3ca046d5209b7450788659c133c55218d64fe61d19715f6f8625575530a0f7eb9b86e35ba8a4929688d6fbbe459cb01685240aa44c02e49e288f7'
            '132a8d7d047d5cacf717ca1b13986699e977c62b64b88590bc2cbb3299fd27ad72d277b078159d7e548ddcefd16ed89208bfa898702b77a6941ff2cf5184ff30')

package() {
  install -dm755 "${pkgdir}/opt"
  install -dm755 "$pkgdir/usr/share/applications"

  install -Dm755 "${srcdir}/bloomee" "${pkgdir}/opt/bloomeetunes/bloomee"
  cp --preserve=mode -r "${srcdir}/data" "${pkgdir}/opt/bloomeetunes/data"
  cp --preserve=mode -r "${srcdir}/lib" "${pkgdir}/opt/bloomeetunes/lib"

  install -m644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"

}
