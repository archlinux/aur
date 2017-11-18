# Maintainer: Felix Barz <skycoder42.de@gmx.de>

_rev=r01
_apilevel=27
pkgname=android-google-apis-x86
pkgver=${_apilevel}_${_rev}
pkgrel=1
pkgdesc="Android Google APIs x86 System Image, latest API"
arch=('any')
url="http://code.google.com/android/add-ons/google-apis"
license=('custom')
depends=("android-platform")
optdepends=('qemu' 'libvirt')
provides=("${pkgname}-${_apilevel}")
conflicts=("${pkgname}-${_apilevel}")
options=('!strip')
source=("https://dl-ssl.google.com/android/repository/sys-img/google_apis/x86-${pkgver}.zip"
        "source.properties")
sha512sums=('24ea8b433643a9e35a158a48bb6719a479a9d058ff0b861e7f4b7b5b1459a3888fd11610e5f30943aa4e6e77a8876d929884788b3837841a939331b972450e13'
            '1f02443217024eaaf6a56e9062467fa656d2600b9fcfb6c6b636eda0609c4a1fcfc5765e847ae8cf391cefc84f7f1e468d0c06f8877ce21af03fd3670c8954b8')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/google_apis/"
  mkdir -p "${_destdir}"
  mv "${srcdir}"/x86 "${_destdir}/"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}/${_apidir}/x86"

  chmod -R ugo+rX "${pkgdir}/opt"
}
