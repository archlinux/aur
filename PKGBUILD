# Maintainer: Felix Barz <skycoder42.de@gmx.de>
# Contributor lestb <tkhdlstfl dot l plus aur at gmail dot com>

_apilevel=28
_rev=r05
pkgname=android-google-apis-x86
pkgver=${_apilevel}_${_rev}
pkgrel=2
pkgdesc="Android Google APIs x86 System Image, latest API"
arch=('any')
url="https://developer.android.com/studio/index.html"
license=('custom')
depends=("android-platform")
optdepends=('qemu' 'libvirt')
provides=("${pkgname}-${_apilevel}")
conflicts=("${pkgname}-${_apilevel}")
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/sys-img/google_apis/x86-${pkgver}.zip"
        "source.properties")
sha384sums=('058d0055478ff9615e0d637b5de1d487fab48755258b38d378231c83a55e92fde25b5cda7ca18f57366989789b62d5c0'
            '422b6afb7b44297fe0752f0c4008054c2976d0315383aae7277c05216761627209fe953fb1dd3e905b83e94c1138d8da')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/google_apis/"
  mkdir -p "${_destdir}"
  mv "${srcdir}"/x86 "${_destdir}/"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}/${_apidir}/x86"

  chmod -R ugo+rX "${pkgdir}/opt"
}
