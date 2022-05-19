# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=lfp
pkgver=1.6
pkgrel=1
pkgdesc='LF-Preview, a wrapper for the lf file manager with image previews, and other features'
license=('MIT')
arch=('x86_64')
install='lfp.install'
url="https://gitlab.com/a4to/lfp"
depends=(lf zsh ffmpeg ueberzug graphicsmagick ghostscript bat)
optdepends=(
  'dialog: Required by many lfp functions outside the scope of image and video previews'
  'dunst: To receive notifications upon task completion and so forth'
  )
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  'e8ccef139564ca1bd8e53cb10191601bf9841fdb4eb5ec7c52d8dff5d03205cf9f277c30084d779d5853aaee0d897ddde321a577f360da14ce786e0ccf67f808'
  '1eacb692bbe3dc98bd61ae02e9350e68722986200043d0b125dc7e75fea66c02e81634052b91695b01f9096daa61961f314a04f5e23611b6b3b663700501396f'
  )
md5sums=(
  '677a165df22d6de4aa1fc41d09d84e03'
  '363187a0b0267df1656f5da2d174af73'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
  install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin/"
  install -Dm755 usr/share/${pkgname}/* -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/doc/${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
