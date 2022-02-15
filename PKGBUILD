# Maintainer: Samuel Collins <samuel.collins@live.co.uk>
# Co-Maintainer: Bradley Garrod <bradleybredgarrod@gmail.com>

_pkgname=pexip-infinity-connect
pkgname="${_pkgname}-bin"
pkgdesc='Pexip Infinity Connect App'
_buildno_in_url='66225.6.8-1'
pkgver="1.9.0"
pkgrel=1
url='https://www.pexip.com/apps'
license=('custom')
arch=('x86_64')
depends=('nss' 'xdg-utils' 'gtk3' 'libxss')
source=("https://www.pexip.com/hubfs/pexip-infinity-connect_${pkgver}-${_buildno_in_url}_amd64.deb")
md5sums=('4887fe8c6287991653a76a1d51f83e10')
sha1sums=('72c8e49a9430a38054ede0a2716b377b6184e042')
sha512sums=('dde62b4da382970264e3aa686843efc73b960f3171bc476b907d2b10ffa3e24ab12dbac2df5d5a970670f4feb0150ff1e9d0788f908d301584f030180971f9bc')

package() {
    tar --no-same-owner -xJC "$pkgdir" -f data.tar.xz

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    for license_file in LICENSE LICENSES.chromium.html; do
        mv "$pkgdir/usr/lib/pexip-infinity-connect_linux-x64/${license_file}" \
            "$pkgdir/usr/share/licenses/$pkgname"
    done
}
