# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=ocenaudio
pkgname="$_pkgname-bin"
pkgver=3.0.3
pkgrel=1
pkgdesc="Cross-platform, easy to use, fast and functional audio editor"
arch=('i686' 'x86_64')
url="http://www.ocenaudio.com.br/"
license=('custom')
depends=('desktop-file-utils' 'gtk-update-icon-cache' 'pulseaudio' 'qt5-base'
         'shared-mime-info')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=("$_pkgname.install")
source=("LICENSE.txt")
sha256sums=('056a0443fc2a8a562d193dd1acdc99933b9ceada4f8f544f89c314253b117801')
sha256sums_i686=('7515831135bfb7e2023c02f27b5c7f19711e0af111b14da10ec4ca8ddd74cef8')
sha256sums_x86_64=('65fc9b1b2dbdb12ff782ab0b0bbb6c707c0faeaaea61e430554a492075034044')
source_i686=("http://www.ocenaudio.com.br/downloads/ocenaudio_debian32.deb")
source_x86_64=("http://www.ocenaudio.com.br/downloads/ocenaudio_debian64.deb")

package() {
  tar -xJf ${srcdir}/data.tar.xz -C "${pkgdir}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/$_pkgname/bin/${_pkgname}" "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  rm -rf "${pkgdir}/var"
}
