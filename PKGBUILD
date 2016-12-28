# Maintainer: Max Kueng <me [at] maxkueng [dot] com>
pkgname=yakyak
pkgver=1.4.0
pkgrel=0
pkgdesc="Desktop client for Google Hangouts"
arch=('x86_64' 'i686')
url="https://github.com/yakyak/yakyak"
license=('MIT')
depends=('libgcrypt15' 'libnotify' 'gconf' 'alsa-lib' 'nss' 'libxtst' 'gtk2' 'libgnome-keyring' 'icu')
optdepends=('emojione-color-font: Emoji support')

case $CARCH in
  'x86_64')
    _arch='x64'
    sha256sums=('b7d741099d289c592725acf884330719e9a1fbc7ca7d19024868324f2997f688'
                '12baee4e3e926b765ebe21493adb7aa416165c7191f583694670b08d9b9c5360')
    ;;
  'i686')
    _arch='ia32'
    sha256sums=('e3c09c55f8746cd8ce95baa0d2993d574ac8eb80a96a48e1030c40665762f01d'
                '12baee4e3e926b765ebe21493adb7aa416165c7191f583694670b08d9b9c5360')
    ;;
esac

source=("yakyak.tar.gz::https://github.com/yakyak/yakyak/releases/download/v${pkgver}/yakyak-1.4.0-linux-${_arch}.tar.gz"
        "yakyak.desktop")

package() {
  install -dm755 "${pkgdir}/usr/share"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/pixmaps"
  install -dm755 "${pkgdir}/usr/share/applications"

  install -Dm644 "${srcdir}/yakyak-linux-${_arch}/resources/app/icons/icon@32.png" "${pkgdir}/usr/share/pixmaps/yakyak.png"
  install -Dm644 "${srcdir}/yakyak.desktop" "${pkgdir}/usr/share/applications/yakyak.desktop"

  mv "${srcdir}/yakyak-linux-${_arch}" "${pkgdir}/usr/share/${pkgname}"
  ln -s "/usr/share/${pkgname}/yakyak" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
