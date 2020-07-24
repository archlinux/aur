# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=bgpalerter-bin
_pkgname=bgpalerter
pkgver=1.26.1
pkgrel=2
pkgdesc="Software to monitor streams of BGP data"
arch=('x86_64')
url="https://github.com/nttgin/BGPalerter"
license=('BSD')
depends=(libsystemd)
conflicts=('bgpalerter')
provides=('bgpalerter')
options=('!strip' '!emptydirs')
source=("${pkgname}-${pkgver}::https://github.com/nttgin/BGPalerter/releases/download//v${pkgver}/bgpalerter-linux-x64"
"https://raw.githubusercontent.com/nttgin/BGPalerter/v${pkgver}/LICENSE"
"https://raw.githubusercontent.com/nttgin/BGPalerter/v${pkgver}/config.yml.example"
"https://raw.githubusercontent.com/nttgin/BGPalerter/v${pkgver}/prefixes.yml.example"
bgpalerter.service)
sha512sums=('9349a11d67a827da5681c4dc4750bdfb608e2b11496eb4b2d8de87e07176658e084dc9df717e8bd1344d86c62d8dc10a03e7262f100882ec03832d50b798c11e'
            'ed598df7608d106b0d0cce2728a6a6f804002b365ec1192f5c093a0a1aabe6751b25ad65e4fcf21353c321b228adc639d49b79b7265d2c3a312e7038000fd720'
            'b18e3c0de63b702474d31f2d2265745a154bc444e24655b1649d88cbff6629d873f0a67971b9b84b25410fcb222603c836c562d1093192457f9fc7387c09fe8a'
            '14f8cc4052eda6bd1d6d08e7150b4456b1133f18f48ea7d2e98a67fde5c78260d29289c024e91bdeb80bc9fd20e731b82e818b87bc6594202057847d14a84a8e'
            '98b70756dabd2590dbdfcaa55e45a2cf8171e27f420c482fa10b3175ebbf26c2c98e1cb99cc27191bb371441f28d95d5e265f7633abc38692f8194e49f34109e')

package(){
	cd "${srcdir}"
	install -Dm644  LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    	install -Dm644  bgpalerter.service "${pkgdir}/usr/lib/systemd/system/bgpalerter.service"
 	install -Dm755  ${pkgname}-${pkgver} "${pkgdir}/opt/${_pkgname}/bgpalerter"
 	install -Dm644  *.example -t "${pkgdir}/opt/${_pkgname}/"

}

