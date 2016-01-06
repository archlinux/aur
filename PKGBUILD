# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=ocenaudio
pkgname="$_pkgname-bin"
pkgver=3.0.4
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
sha256sums_i686=('10e79ce4922b23ec868fef3666d481105c2489b127528c589eca84236277b129')
sha256sums_x86_64=('e23dd32ab5dc77e51387d2202ee760489b4a82f3ace2bc7e622b3e128168638b')
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
