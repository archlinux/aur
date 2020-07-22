# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=bgpalerter-bin
_pkgname=bgpalerter
pkgver=1.26.0
pkgrel=2
pkgdesc="Software to monitor streams of BGP data"
arch=('x86_64')
url="https://github.com/nttgin/BGPalerter"
license=('BSD')
depends=(libsystemd)
conflicts=('bgpalerter')
provides=('bgpalerter')
options=('!strip' '!emptydirs')
source=("https://github.com/nttgin/BGPalerter/releases/download//v${pkgver}/bgpalerter-linux-x64"
"https://raw.githubusercontent.com/nttgin/BGPalerter/v${pkgver}/LICENSE"
"https://raw.githubusercontent.com/nttgin/BGPalerter/v${pkgver}/config.yml.example"
"https://raw.githubusercontent.com/nttgin/BGPalerter/v${pkgver}/prefixes.yml.example"
bgpalerter.service)
sha512sums=('76ff412d2f7c4f4333849f30ec838b05c24eee08ab63ca02f7bb135daedb52aa0692643212deb276c7eb0e0e0646d39b51afdc520c68359613170b4158620266'
            'ed598df7608d106b0d0cce2728a6a6f804002b365ec1192f5c093a0a1aabe6751b25ad65e4fcf21353c321b228adc639d49b79b7265d2c3a312e7038000fd720'
            'b18e3c0de63b702474d31f2d2265745a154bc444e24655b1649d88cbff6629d873f0a67971b9b84b25410fcb222603c836c562d1093192457f9fc7387c09fe8a'
            '14f8cc4052eda6bd1d6d08e7150b4456b1133f18f48ea7d2e98a67fde5c78260d29289c024e91bdeb80bc9fd20e731b82e818b87bc6594202057847d14a84a8e'
            'd69b583be7e1117e077bf1cea8025c9e60f2231feb966a1d95330e060cf0538c3da1fdedddcdaca1971f0d23e273e1c11aa01d7767cc2833f7bfc1d19a940ba5')

package(){
	cd "${srcdir}"
	install -Dm644  LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    	install -Dm644  bgpalerter.service "${pkgdir}/usr/lib/systemd/system/bgpalerter.service"
 	install -Dm755  bgpalerter-linux-x64 "${pkgdir}/opt/${_pkgname}/bgpalerter"
 	install -Dm644  *.example -t "${pkgdir}/opt/${_pkgname}/"

}

