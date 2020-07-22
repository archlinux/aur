# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=bgpalerter-bin
_pkgname=bgpalerter
pkgver=1.26.0
pkgrel=1
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
bgpalerter.service)
sha512sums=('76ff412d2f7c4f4333849f30ec838b05c24eee08ab63ca02f7bb135daedb52aa0692643212deb276c7eb0e0e0646d39b51afdc520c68359613170b4158620266'
            'ed598df7608d106b0d0cce2728a6a6f804002b365ec1192f5c093a0a1aabe6751b25ad65e4fcf21353c321b228adc639d49b79b7265d2c3a312e7038000fd720'
            'f6baf26b28c7abf9e28174e69d081d98cd8e39751df63750cc029563e317d3ff002216b9b355d965f8f4ffb5fa31ee7594101776cc226e3b6acd9753d1da7f38')

package(){
	cd "${srcdir}"
	install -Dm644  LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    	install -Dm644  bgpalerter.service "${pkgdir}/usr/lib/systemd/system/bgpalerter.service"
 	install -Dm755  bgpalerter-linux-x64 "${pkgdir}/usr/bin/bgpalerter"
}

