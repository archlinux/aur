# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname='aranea'
pkgver='6.469b9ee'
pkgrel=1
pkgdesc='A fast and clean dns spoofing tool'
arch=('any')
url='https://github.com/TigerSecurity/aranea'
license=('unknown')
depends=('libpcap')
source=('https://github.com/TigerSecurity/aranea/archive/master.zip')
md5sums=('3fe6d9d19fa686f63ea79f31a2e7921f')

build() {
	cd "${srcdir}/${pkgname}-master"
        make
}

package() {
	cd "${srcdir}/${pkgname}-master"
        install -dm755 "${pkgdir}/usr/bin"
        install -dm755 "${pkgdir}/usr/share/${pkgname}"
        cp * "${pkgdir}/usr/share/${pkgname}/"
        ln -s "/usr/share/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

}
