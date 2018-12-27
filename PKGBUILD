# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Sebba <sebba at cock dot li>
_pkgname='transgui'
pkgname='transmission-remote-gui-bin'
pkgver='5.16.0'
pkgrel=1
pkgdesc='Cross platform remote GUI for the Transmission daemon'
arch=('i686' 'x86_64')
url='https://github.com/leonsoft-kras/transmisson-remote-gui'
license=('GPL2')
depends=('gtk2' 'desktop-file-utils')
provides=('transmission-remote-gui')
conflicts=('transmission-remote-gui-gtk2' 'transmission-remote-gui-qt4'
           'transmission-remote-gui-svn' 'transmission-remote-gui')
source=("${_pkgname}.desktop")
source_i686=("https://github.com/leonsoft-kras/${pkgname%%-bin}/releases/download/v$pkgver/$_pkgname-$pkgver-i686-linux.txz")
source_x86_64=("https://github.com/leonsoft-kras/${pkgname%%-bin}/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-linux.txz")
sha256sums=('e7ca207f88fd98423b45476370c6899cacb8f0d9a0361e231a2e1b32ce36be51')
sha256sums_i686=('75aa8a5c22ab4bf1046f2fe1e382b7637e732adfe89ba8b2713945f4343bc1de')
sha256sums_x86_64=('0cf710c8a623052b9c3a1a363a1cba02e1d719c20551e870b4c18025532b2267')

package() {
  cd "${srcdir}"
  install -D -m 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -d -m 755 "${pkgdir}/usr/share/${_pkgname}/lang"
  install -D -m 644 lang/transgui.* "${pkgdir}/usr/share/${_pkgname}/lang"
  rm "${pkgdir}/usr/share/${_pkgname}/lang/transgui.template"
  install -d -m 755 "${pkgdir}/usr/share/doc/${_pkgname}"
  install -D -m 644 README.md history.txt LICENSE \
    "${pkgdir}/usr/share/doc/${_pkgname}"
  install -D -m 644 "${_pkgname}.png" \
    "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -D -m 644 "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
