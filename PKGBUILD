# Maintainer: Connor Etherington <nu1l@null.net>
# ---
pkgname=lfcd
pkgver=1.0.r2
pkgrel=1
pkgdesc='A wrapper for the lf file manager, with built in image previews and on-exit directory changing'
arch=(any)
url="https://gitlab.com/qYp/${pkgname}"
license=('MIT')
depends=(lf zsh ffmpeg ueberzug graphicsmagick ghostscript)
makedepends=(git)
source=("git+$url.git")
sha256sums=('SKIP')

package() {
  cd "${pkgname}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 ${srcdir}/${pkgname}/{lfcdrc,scope,cleaner} -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
