# Maintainer: westlaw
pkgname=m32-edit
pkgver=4.4.1
pkgrel=1
pkgdesc="M32-Edit for Midas M32 mixer"
arch=('x86_64')
url='https://www.midasconsoles.com/en/products/0603-AEO'
license=('custom:proprietary')
depends=('alsa-lib' 'curl' 'freetype2' 'gcc-libs' 'glibc' 'libx11'
         'libxcursor' 'libxext' 'libxinerama' 'libxrandr')
optdepends=('gtk3: native file chooser' 'libxss: screensaver integration')
options=('!strip' '!debug')
source=("https://cdn-media.empowertribe.com/9ba5bed1bc7a427cb96cef8aeb49f097/M32-Edit_LINUX_${pkgver}.tar.gz"
        'm32-edit.desktop'
        'm32-edit.png')
sha256sums=('704bdad81af1a3bce6deaa693be06d608954a95f6debd8fef1fea0f780b88b77'
            '9a63cb6c053e8b7c85d7cee55b4cd97dd2dec813351c6d7b3e3b1617d11f217d'
            'c9f923c2fd4b0b71cc1bf3ecb6a4a2c8c7529899856c1678753b624913dd3960')

package() {
  cd "${srcdir}"
  install -D -m755 "${srcdir}/M32-Edit"         "${pkgdir}/usr/bin/m32-edit"
  install -D -m644 "${srcdir}/m32-edit.desktop" "${pkgdir}/usr/share/applications/m32-edit.desktop"
  install -D -m644 "${srcdir}/m32-edit.png"     "${pkgdir}/usr/share/pixmaps/m32-edit.png"
  install -Dm644 "Release-Notes_M32 Edit_v${pkgver}.pdf" \
    "${pkgdir}/usr/share/doc/${pkgname}/release-notes.pdf"
}
