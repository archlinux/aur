# Maintainer: djazz

pkgname=ultrastardx-utility
pkgver=0.3
pkgrel=2
pkgdesc="Manage UltraStar Deluxe songs."
arch=('any')
url="https://github.com/daniel-j/usdx-linux-utility"
license=('GPL')
depends=('zenity')
optdepends=(
  'ultrastardx: UltraStar Deluxe'
  'imagemagick: Thumbnail generator'
)
source=("https://github.com/daniel-j/usdx-linux-utility/archive/v${pkgver}.tar.gz")
sha256sums=(
  '1a94b25e67ff5a3f87faa27952065735318fd975d262d5e0825d717743be58d8'
)

#pkgver() {
#  cd "$pkgname"
#  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

package() {
  cd "${srcdir}/usdx-linux-utility-${pkgver}"
  install -d "$pkgdir/usr/share/${pkgname}"
  install "prompt.html" "$pkgdir/usr/share/${pkgname}/prompt.html"

  # applications
  install -d "${pkgdir}/usr/share/applications"
  install "usdx-open.desktop" "${pkgdir}/usr/share/applications/usdx-open.desktop"

  # bin
  install -d "${pkgdir}/usr/bin"
  install "usdx-open.sh" "${pkgdir}/usr/bin/usdx-open"
  install "usdx-thumbnailer.sh" "${pkgdir}/usr/bin/usdx-thumbnailer"

  # mime
  install -d "${pkgdir}/usr/share/mime/packages/"
  install "usdx-open.mime.xml" "${pkgdir}/usr/share/mime/packages/usdx-open.xml"

  # thumbnailer
  install -d "${pkgdir}/usr/share/thumbnailers/"
  install "usdx.thumbnailer" "${pkgdir}/usr/share/thumbnailers/usdx.thumbnailer"

  # Icon
  #install -d "${pkgdir}/usr/share/pixmaps"
  #install "icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Register mimetypes
  
}
