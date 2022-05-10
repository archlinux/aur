# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=lfp
pkgver=1.3
pkgrel=1
pkgdesc='LF-Preview, a wrapper for the lf file manager with image previews, and other features'
license=('MIT')
arch=('x86_64')
install="lfp.install"
url="https://gitlab.com/a4to/lfp"
depends=(lf zsh ffmpeg ueberzug graphicsmagick ghostscript)
optdepends=(
  'dialog: Required by many lfp functions outside the scope of image and video previews'
  'dunst: To receive notifications upon task completion and so forth'
  )
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '8c42237dfe70237f04f7c1e44db751e99ffbdfb628d61bdf1668fe7cf6793887fe51096e3aac46779a18f53c959b3d0ef7a91d851c0fe77378fc41c9356de671'
  'df8e01944a1223a2a1befd959f776877686bcf0d1970f50032f11bb9fc5e03c8d07f0ce8b7ad60306da35d4faf783c5f1ad0044b310b7f06ab1e2e9163dbfae2'
  )
md5sums=(
  'a9b4a89fa83b0a9c2082ebaa83e62229'
  'c17cf1054da57043f9438c0dc305302e'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
  install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin/"
  install -Dm755 usr/share/${pkgname}/* -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/doc/${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
