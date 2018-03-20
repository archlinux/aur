# Maintaner: GFdevelop
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

_apilevel=23
_arch=x86
pkgname=android-${_arch}-system-image-${_apilevel}
pkgver=r10
pkgrel=2
pkgdesc="Android x86 Atom System Image, API-${_apilevel}"
arch=('any')
url="https://developer.android.com/studio/index.html"
license=('custom')
depends=("android-platform-${_apilevel}")
optdepends=('qemu' 'libvirt')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=('!strip')
source=("https://dl.google.com/android/repository/sys-img/android/${_arch}-${_apilevel}_${pkgver}.zip")
sha1sums=('f6c3e3dd7bd951454795aa75c3a145fd05ac25bb')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/default"
  mkdir -p "${_destdir}"
  mv "${srcdir}/${_arch}" "${_destdir}/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
