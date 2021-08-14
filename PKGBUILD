# Maintainer: Samuel Collins <samuel.collins@live.co.uk>
# Co-Maintainer: Bradley Garrod <bradleybredgarrod@gmail.com>

_pkgname=pexip-infinity-connect
pkgname="${_pkgname}-bin"
pkgdesc='Pexip Infinity Connect App'
_buildno_in_url='62088.0.0-1'
pkgver="1.8.0"
pkgrel=1
url='https://www.pexip.com/apps'
license=('custom')
arch=('x86_64')
depends=('nss' 'xdg-utils' 'gtk3' 'libxss')
source=("https://www.pexip.com/hubfs/pexip-infinity-connect_${pkgver}-${_buildno_in_url}_amd64.deb")
md5sums=('4d38950f6ff9f5f51380ddb6f67364f2')
sha1sums=('ebb6b640110ad2d9e4c1275872616fc7e1e3f7a1')
sha512sums=('6bb5899b96b74aa49d501f466d397dc4bd88542d07e23bf83ecc7f06a6f9dea4d9dd212326c121e88139a7b5c2cc78ee5ba9b8e61dbbe9bd8318b25f759ea6f5')

package() {
    tar --no-same-owner -xJC "$pkgdir" -f data.tar.xz

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    for license_file in LICENSE LICENSES.chromium.html; do
        mv "$pkgdir/usr/lib/pexip-infinity-connect_linux-x64/${license_file}" \
            "$pkgdir/usr/share/licenses/$pkgname"
    done
}
