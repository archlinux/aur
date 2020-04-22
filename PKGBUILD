# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

_pkgname=pexip-infinity-connect
pkgname="${_pkgname}-bin"
pkgdesc='Pexip Infinity Connect App'
_buildno_in_url='53013.154.0'
pkgver="1.6.1"
pkgrel=1
url='https://www.pexip.com/apps'
license=('custom')
arch=('x86_64')
depends=('nss' 'xdg-utils' 'gtk3' 'libxss')
source=("https://dl.pexip.com/connect/nextgen/${pkgver}/${_pkgname}_${pkgver}-${_buildno_in_url}_linux-x64.deb")
md5sums=('f1f3c13b78e776ccc9e5df9ea7fdbe1b')
sha1sums=('c0c6a80ec1ab667a23e3f753096dc7fa2d49adb0')
sha512sums=('f7229175069392b413ad8378ac67d35bdd669dc357efc7ea98bc4685657ca9f3b8c5296b20fafba4337cc4e56059a6413423723281163fbb8a3c7974201c7598')

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
