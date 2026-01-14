# Maintainer: Alex Flierl <shad0w73 at freenet dot de>

_repo='https://gitlab.alpinelinux.org/alpine/aports'
_commit=3be504af77e6a5c639dc6111a4624d2f40f8991f
pkgname=adguardhome-openrc
pkgver=20250416
pkgrel=1
pkgdesc='OpenRC adguardhome init script'
arch=('any')
url="${_repo}/-/tree/master/testing/adguardhome"
# See https://gitlab.alpinelinux.org/alpine/aports/-/issues/9074
license=('unknown')
depends=('openrc' 'adguardhome')
provides=('init-adguardhome')
conflicts=('init-adguardhome')
source=("${_repo}/-/raw/${_commit}/testing/adguardhome/adguardhome.confd"
        "${_repo}/-/raw/${_commit}/testing/adguardhome/adguardhome.initd"
        'adguardhome.sysusers'
        'adguardhome.tmpfiles')
sha256sums=('2e8de4fe94c4a98e015ab5087670e3a9d406623ef518c57575c7240ded91540d'
            '004274c6ec39c56a21f24281d550f81288db0669e9ea1a9980423059ceeeaf3b'
            'cb3089f85a0188255e74c6ec21e1a433e9c4e2ea3cc2920f91fbf384dce56b77'
            'd847934161583bd84882c726bd34238524d0f256230fc1f64005e9ec5d699dcb')

package() {
	install -Dm 644 "${srcdir}"/adguardhome.confd "${pkgdir}"/etc/conf.d/adguardhome
	install -Dm 755 "${srcdir}"/adguardhome.initd "${pkgdir}"/etc/init.d/adguardhome
	install -Dm 644 "${srcdir}"/adguardhome.sysusers "${pkgdir}"/usr/lib/sysusers.d/adguardhome.conf
	install -Dm 644 "${srcdir}"/adguardhome.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/adguardhome.conf
}
