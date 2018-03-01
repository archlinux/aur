# Maintainer: Felix Barz <skycoder42.de@gmx.de>
# Contributor lestb <tkhdlstfl dot l plus aur at gmail dot com>
_rev=r04
_apilevel=27
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
sha1sums=('0771704f8c12ef86d02278659694ba543354b097'
          '8cb7cfdf81b81d55ab3c83cd1a8d4142dfbc3c53')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/google_apis/"
  mkdir -p "${_destdir}"
  mv "${srcdir}"/x86 "${_destdir}/"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}/${_apidir}/x86"

  chmod -R ugo+rX "${pkgdir}/opt"
}
