# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=lfp
pkgver=1.0.2
pkgdesc='LF-Preview, a wrapper for the lf file manager with image previews, and other features'
pkgrel=1
arch=('x86_64')
license=('MIT')
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
  '4b76b0b4191cc31311a4bdbc99420a291890465e5414d83ad648bd9520ad0f0c509ad9e7e2bfc6dd5505eca6e6e2d0c54d1accf242edb548d5541681774720d4'
  '8673d833eb0bb6acbf110efa81e7ce67c77d1d6f0dd20127aa01240753d1c0a60754591deeca51eb0654d4e5de4b65db102e67d8ab8d5fc4ea927088f56ac226'
  )
md5sums=(
  '8b54efd97f5f6b2775e95c173ecbdb3a'
  '12f72c74cbb65c4ff5321cfab67154df'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
  install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin/"
  install -Dm755 usr/share/${pkgname}/* -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/doc/${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
