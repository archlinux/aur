# Maintainer: Samuel Collins <samuel.collins@live.co.uk>
# Co-Maintainer: Bradley Garrod <bradleybredgarrod@gmail.com>

_pkgname=pexip-infinity-connect
pkgname="${_pkgname}-bin"
pkgdesc='Pexip Infinity Connect App'
_buildno_in_url='71681.0.0-1'
pkgver="1.12.1"
pkgrel=1
url='https://www.pexip.com/apps'
license=('custom')
arch=('x86_64')
depends=('nss' 'xdg-utils' 'gtk3' 'libxss')
source=("https://www.pexip.com/hubfs/Infinity%20Connect/${pkgver}/pexip-infinity-connect_${pkgver}-${_buildno_in_url}_amd64.deb")
sha256sums=('d6ed24bd00538267f0c5da4fcae7341291dbcff6a2b61f33c7e75068692a7d91')

package() {
    tar --no-same-owner -xJC "$pkgdir" -f data.tar.xz

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    for license_file in LICENSE LICENSES.chromium.html; do
        mv "$pkgdir/usr/lib/pexip-infinity-connect_linux-x64/${license_file}" \
            "$pkgdir/usr/share/licenses/$pkgname"
    done
}
