# Maintainer: afward <archlinux.gargoyley@simplelogin.co>
pkgname="yakyak-bin"
pkgver=1.5.7
_pkgid="${pkgname}-${pkgver}"
pkgrel=1
pkgdesc="Desktop chat client for Google Hangouts"
arch=('x86_64' 'i686')
url="https://github.com/yakyak/yakyak"
license=('MIT')
optdepends=('emojione-color-font: Emoji support')
provides=('yakyak')
conflicts=('yakyak')

sha256sums_x86_64=('1a9bc89aff4de28b7826d2c7af487a9c894482b573d61bf08b35bd0dc0704e16')
sha256sums_i686=('1a9bc89aff4de28b7826d2c7af487a9c894482b573d61bf08b35bd0dc0704e16')

source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/yakyak/yakyak/releases/download/v${pkgver}/yakyak-${pkgver}-linux-x64-pacman.tar.gz")
source_i686=("$pkgname-$pkgver.tar.gz::https://github.com/yakyak/yakyak/releases/download/v${pkgver}/yakyak-${pkgver}-linux-ia32-pacman.tar.gz")

package() {
  cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
  cp -R "${srcdir}/opt/" "${pkgdir}/opt/"
  mkdir "${pkgdir}/usr/bin/"
  ln -s "${pkgdir}/opt/yakyak/yakyak" "${pkgdir}/usr/bin/yakyak"
}
