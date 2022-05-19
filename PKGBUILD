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
  'e1dcef52812948d36b058f95b316e55e2e187acffdeec8047fa8984ef562583aeeb649e072a22ff2bf7413f1f9695e2b304861a2cec0351eb657f25a0e6763ce'
  'd063a935fde0a7ef56b146143a35177f69961ba85f0ddb0caf30a29c22022f3ecddb83762c269ed729a0447e142591961c89c1c3acd3c62c93e0edbd93298cf8'
  )
md5sums=(
  'c1ca14038833541aa9b5a4c126272855'
  '69bd7dab4c0b8af31c1ce1908c31bb12'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
  install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin/"
  install -Dm755 usr/share/${pkgname}/* -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/doc/${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
