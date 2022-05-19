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
  '8fdf461c595db7f2460ab7953b59b8d263e7d6757759d57995041be0127c23b2314b8a851e09a7b31145649b8b6739984b0350928636b9d7d06778ea24a0c16e'
  'bfcb047a76bde5e027802072b0831fd0242c1d993a6fccbd09566d2143eb5b1ddd257d9b47bcca3d188a7529882936d3c66173fbf6260cf67a3d1ed1987231a4'
  )
md5sums=(
  'c73dcd774f2ef298dde1d290a420aac5'
  '90496121b921c1568d93cea0441cd36d'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
  install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin/"
  install -Dm755 usr/share/${pkgname}/* -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/doc/${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
