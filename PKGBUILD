# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=ocenaudio
pkgname="$_pkgname-bin"
pkgver=3.0.5
pkgrel=1
pkgdesc="Cross-platform, easy to use, fast and functional audio editor"
arch=('i686' 'x86_64')
url="http://www.ocenaudio.com.br/"
license=('custom')
depends=('desktop-file-utils' 'gtk-update-icon-cache' 'jack' 'pulseaudio'
         'qt5-base' 'shared-mime-info')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=("$_pkgname.install")
source=("LICENSE.txt")
sha256sums=('056a0443fc2a8a562d193dd1acdc99933b9ceada4f8f544f89c314253b117801')
sha256sums_i686=('8389827e1863277fd70167c5b2520710a8cfc9b92ae5650b5bbaee3ed23ec0b2')
sha256sums_x86_64=('9453de656f87fdd1cd23f3036df60b499bff9e3f954f6b54005e8bbc6f50d246')
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
