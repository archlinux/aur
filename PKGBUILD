# Maintainer: Samuel Collins <samuel.collins@live.co.uk>
# Co-Maintainer: Bradley Garrod <bradleybredgarrod@gmail.com>

_pkgname=pexip-infinity-connect
pkgname="${_pkgname}-bin"
pkgdesc='Pexip Infinity Connect App'
_buildno_in_url='62992.13.5-1'
pkgver="1.8.6"
pkgrel=1
url='https://www.pexip.com/apps'
license=('custom')
arch=('x86_64')
depends=('nss' 'xdg-utils' 'gtk3' 'libxss')
source=("https://www.pexip.com/hubfs/pexip-infinity-connect_${pkgver}-${_buildno_in_url}_amd64.deb")
md5sums=('67b4c742e68f76e914a03ed2b5eb1586')
sha1sums=('d28368a141598dda0b723f0e2f13f168cc22f1ad')
sha512sums=('95bc600bd5f4637d65f610e9c6b6f3b78949ea8472597d5a4b457e43fb3fd2300273944acf26eabcc5c5547b89586a6f335c8918db116dcc0c67ee91bdc4faea')

package() {
    tar --no-same-owner -xJC "$pkgdir" -f data.tar.xz

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    for license_file in LICENSE LICENSES.chromium.html; do
        mv "$pkgdir/usr/lib/pexip-infinity-connect_linux-x64/${license_file}" \
            "$pkgdir/usr/share/licenses/$pkgname"
    done
}
