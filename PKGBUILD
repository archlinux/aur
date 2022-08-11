# Maintainer: Samuel Collins <samuel.collins@live.co.uk>
# Co-Maintainer: Bradley Garrod <bradleybredgarrod@gmail.com>

_pkgname=pexip-infinity-connect
pkgname="${_pkgname}-bin"
pkgdesc='Pexip Infinity Connect App'
_buildno_in_url='68467.47.0-1'
pkgver="1.10.0"
pkgrel=1
url='https://www.pexip.com/apps'
license=('custom')
arch=('x86_64')
depends=('nss' 'xdg-utils' 'gtk3' 'libxss')
source=("https://www.pexip.com/hubfs/pexip-infinity-connect_${pkgver}-${_buildno_in_url}_amd64.deb")
md5sums=('eeeabbeb1fcd69e18db66215e0732716')
sha1sums=('ffdebd886be89c64e4ae8f716e37bb89927952a7')
sha512sums=('b9f7743d3d42cadc375738b9d380ffdbcba8d5c2311236c31966921b5187a189bc32d4a188951f8beaa3294e2ba3728a8af6ba11045190714c845f81123457c0')

package() {
    tar --no-same-owner -xJC "$pkgdir" -f data.tar.xz

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    for license_file in LICENSE LICENSES.chromium.html; do
        mv "$pkgdir/usr/lib/pexip-infinity-connect_linux-x64/${license_file}" \
            "$pkgdir/usr/share/licenses/$pkgname"
    done
}
