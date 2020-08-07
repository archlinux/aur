# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

_pkgname=pexip-infinity-connect
pkgname="${_pkgname}-bin"
pkgdesc='Pexip Infinity Connect App'
_buildno_in_url='53046.187.0'
pkgver="1.6.2"
pkgrel=1
url='https://www.pexip.com/apps'
license=('custom')
arch=('x86_64')
depends=('nss' 'xdg-utils' 'gtk3' 'libxss')
source=("https://dl.pexip.com/connect/nextgen/${pkgver}/${_pkgname}_${pkgver}-${_buildno_in_url}_linux-x64.deb")
md5sums=('1aa38c3c8a2af180f9a35912e659ec4c')
sha1sums=('e1ca0ff25f0a5d665d444dc10ac7549069cd3725')
sha512sums=('8aa455a52c4340e7df1fbb38dcab7b6b1de6c14540c3111e3e517f046dd2ded70b4c7236b2de6f12daa152b06c525e0c37fdba8fafaa6b088e40450b70eb2f8c')

package() {
    tar --no-same-owner -xJC "$pkgdir" -f data.tar.xz

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    for license_file in LICENSE LICENSES.chromium.html; do
        mv "$pkgdir/usr/lib/pexip-infinity-connect_linux-x64/${license_file}" \
            "$pkgdir/usr/share/licenses/$pkgname"
    done

    ln -s /usr/lib/pexip-infinity-connect_linux-x64/pexip-infinity-connect \
        "$pkgdir/usr/bin/pexip-infinity-connect"
}
