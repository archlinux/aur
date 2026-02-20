pkgname=random-pics-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Fast desktop local image viewer for gesture drawing practice"
arch=('x86_64')
url="https://github.com/YukiYuziriha/random-pics"
license=('MIT')
depends=('glibc' 'gtk3' 'webkit2gtk-4.1')
provides=('random-pics')
conflicts=('random-pics')
_appimage="random-pics_${pkgver}_amd64.AppImage"
source=(
  "https://github.com/YukiYuziriha/random-pics/releases/download/v${pkgver}/${_appimage}"
  "random-pics.desktop"
  "random-pics.png"
)
sha256sums=(
  '7f09335fcd0636bd67517334dc843baa3b03dc4db07b7d79bbde1650db3467d3'
  '9b249bc89320a997036b154bff50af2a9d917ac39610db0a5d9ca7185319cb05'
  'eeebf55d8ffe07348786b9057af253e3ca08c56b6a8f8893826381430e3c0b7b'
)

package() {
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/random-pics/random-pics.AppImage"
  install -Dm644 "${srcdir}/random-pics.desktop" "${pkgdir}/usr/share/applications/random-pics.desktop"
  install -Dm644 "${srcdir}/random-pics.png" "${pkgdir}/usr/share/pixmaps/random-pics.png"
  install -d "${pkgdir}/usr/bin"
  ln -sf "/opt/random-pics/random-pics.AppImage" "${pkgdir}/usr/bin/random-pics"
}
