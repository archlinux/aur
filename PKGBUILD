# Maintaner: GFdevelop

_apilevel=23
_arch=x86
pkgname=android-google-apis-${_arch}-system-image-${_apilevel}
pkgver=r26
pkgrel=1
pkgdesc="Android Google APIs x86 System Image, API-${_apilevel}"
arch=('any')
url="https://developer.android.com/studio/index.html"
license=('custom')
depends=("android-platform-${_apilevel}")
optdepends=('qemu' 'libvirt')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=('!strip')
source=("https://dl.google.com/android/repository/sys-img/google_apis/${_arch}-${_apilevel}_${pkgver}.zip")
sha1sums=('2b65941874839287225b5b4852b291516bd895f4')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/google_apis/"
  mkdir -p "${_destdir}"
  mv "${srcdir}/${_arch}" "${_destdir}/"

  chmod -R ugo+rX "${pkgdir}/opt"
}
