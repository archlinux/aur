# Maintainer: Felix Barz <skycoder42.de@gmx.de>
# Contributor lestb <tkhdlstfl dot l plus aur at gmail dot com>

_apilevel=29
_rev=r07
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
source=("https://dl-ssl.google.com/android/repository/sys-img/google_apis/x86-${pkgver}-linux.zip"
        "source.properties")
sha1sums=('d07c160db6c74083e27b42dbac73fae9421082f7'
          'SKIP')
sha384sums=('c94e3b02d44030b9a76ca595f92451d254168e4dcdf9022a3f9cef01f99b91f0c1991ce0be61d911ee3842c998247366'
            'b7c61c67c9951dddb523117f9049570800fc412f13211b96b3c55e6f736b53922a1d649bd6ecf20916b084ba5a8bd57b')

package() {
  _destdir="${pkgdir}/opt/android-sdk/system-images/android-${_apilevel}/google_apis/"
  mkdir -p "${_destdir}"
  mv "${srcdir}"/x86 "${_destdir}/"
  install -Dm644 "${srcdir}/source.properties" "${_destdir}/${_apidir}/x86"

  chmod -R ugo+rX "${pkgdir}/opt"
}
