# Maintainer: Samuel Collins <samuel.collins@live.co.uk>
# Co-Maintainer: Bradley Garrod <bradleybredgarrod@gmail.com>

_pkgname=pexip-infinity-connect
pkgname="${_pkgname}-bin"
pkgdesc='Pexip Infinity Connect App'
_buildno_in_url='66240.21.2-1'
pkgver="1.9.1"
pkgrel=1
url='https://www.pexip.com/apps'
license=('custom')
arch=('x86_64')
depends=('nss' 'xdg-utils' 'gtk3' 'libxss')
source=("https://www.pexip.com/hubfs/pexip-infinity-connect_${pkgver}-${_buildno_in_url}_amd64.deb")
md5sums=('77b524c2a73a8bf707f06b05130e2891')
sha1sums=('47bf803aeee50354815031585f5fb63d727d9c16')
sha512sums=('7141b550ca66da1d085e61fde88c7ff5410faaaa46970300aabf5b19ec7937c4645f06304a987e3764854be2dfca3ec7762d1d2e836348c3577700c79144d8b4')

package() {
    tar --no-same-owner -xJC "$pkgdir" -f data.tar.xz

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    for license_file in LICENSE LICENSES.chromium.html; do
        mv "$pkgdir/usr/lib/pexip-infinity-connect_linux-x64/${license_file}" \
            "$pkgdir/usr/share/licenses/$pkgname"
    done
}
