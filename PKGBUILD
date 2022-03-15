# Maintainer: Connor Etherington <nu1l@null.net>
# ---
pkgname=lfcd
pkgver=1.0.r1
pkgrel=1
pkgdesc='A wrapper for the lf file manager, with built in image previews and on-exit directory changing'
arch=(any)
url="https://gitlab.com/qYp/${pkgname}"
license=('MIT')
depends=(lf zsh ffmpeg ueberzug graphicsmagick ghostscript)
makedepends=(git)
source=(
  "https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha256sums=(
  'b4ee44caed86525232aae6d26b34a0ac70ff3af407630a554f7b53d18d69fff8'
  'e8bc380abaf009b6dc15a3b95e4373d241596e0d14f0214d746d65c0b3a22a92'
  )

package() {
  install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 usr/share/${pkgname}/{lfcdrc,scope,cleaner} -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/doc/${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
