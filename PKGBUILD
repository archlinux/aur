# Maintainer: Michael Hansen <zrax0111 gmail com>

_rev=r11
_gdkver=xe22
_sdkint=19
pkgname=android-glass-gdk-${_sdkint}
pkgver=${_gdkver}_${_rev}
pkgrel=1
pkgdesc="Google Glass Development Kit Preview, API-${_sdkint}"
arch=('any')
url='https://developers.google.com/glass/develop/gdk/index'
license=('custom')
depends=("android-platform-${_sdkint}")
options=('!strip')
source=("http://dl.google.com/glass/${_gdkver}/google-gdk.zip"
        'source.properties')
sha1sums=('52cadbec4d42ce68a667e7e4ea461ef8b81924ef'
          'e1fbebdeecc03b9e03586a80b19faac185c8a7ed')

package() {
    _addons="${pkgdir}/opt/android-sdk/add-ons"
    mkdir -p "${_addons}"
    mv "${srcdir}/google-gdk" "${_addons}/addon-google_gdk-google-${_sdkint}"

    chmod -R ugo+rX "${pkgdir}/opt"

    cp "${srcdir}/source.properties" "${_addons}/addon-google_gdk-google-${_sdkint}"
}
