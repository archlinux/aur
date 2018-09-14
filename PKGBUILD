# Maintainer: Felix Barz <skycoder42.de@gmx.de>
# Contributor lestb <tkhdlstfl dot l plus aur at gmail dot com>

_apilevel=28
_rev=r05
pkgname=android-google-apis-x86
pkgver=${_apilevel}_${_rev}
pkgrel=1
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
sha384sums=('1ea7ae43c8a1a32cbaea0ab3edac7add6146da12'
            '752766f004ad8ba688e95aa86f8d918be53dd792')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/google_apis/"
  mkdir -p "${_destdir}"
  mv "${srcdir}"/x86 "${_destdir}/"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}/${_apidir}/x86"

  chmod -R ugo+rX "${pkgdir}/opt"
}
