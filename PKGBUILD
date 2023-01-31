# Maintainer: SanskritFritz (gmail)

pkgname=rnd_jue_ii
pkgver=1.2.0
pkgrel=1
pkgdesc="A remake of the game Rocks'n'Diamonds."
arch=('x86_64')
url="http://www.jb-line.de/rnd17/17start_e.html"
license=('GPL2')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2_net' 'smpeg')

source=("https://www.jb-line.de/rnd17/dat/dl_files/rnd_jue_ii-$pkgver-linux.tar.gz"
        "rnd_jue_ii.desktop" "rnd_jue_ii.sh")

md5sums=('00600c8cb17ca970847d41f49d3e9cbe'
         'd482985e35cedf1ac489b26e83c66441'
         'ec3902a93a526f6cd9ef3dff58ecd8ad')

package() {
  cd "${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cp -r * "${pkgdir}/usr/share/${pkgname}"

  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
