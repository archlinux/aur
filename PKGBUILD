# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=bgpalerter-bin
_pkgname=bgpalerter
pkgver=1.29.0
pkgrel=1
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
${_pkgname}.service
${_pkgname}.tmpfiles
${_pkgname}.sysusers)
sha512sums=('9156521d1018518a7158331d1009c46d65d16eb6dead8544f9adfc116100cbce28080a3e02438e85fafa29a8b613d8f758ecb187529d26230e927227fa93b088'
            'ed598df7608d106b0d0cce2728a6a6f804002b365ec1192f5c093a0a1aabe6751b25ad65e4fcf21353c321b228adc639d49b79b7265d2c3a312e7038000fd720'
            'd29f5c1a83d40689af9e4b7c3a7cb9715fee7934a1621810513ae9d6d903b6ca78b1551f1fe74e395a395f6c163e246b4cc5506587e67bebf6ffd524982156d3'
            'f6fc9ac7142f04c651cf9bd11d9480929384ed32b09a9a187399e62657d500c1767284fea641f3bd3db897322b15c15e4dc4c9594f7cc6ff45d9d4e3f88dcfdd'
            '98b70756dabd2590dbdfcaa55e45a2cf8171e27f420c482fa10b3175ebbf26c2c98e1cb99cc27191bb371441f28d95d5e265f7633abc38692f8194e49f34109e'
            '024a6d9c9d476e0e0abe69df852a625e0431becd8a5b3cd1818d6b6d83b62ad797f5baac9e8dd1fadf9d4c440c3f21ddc3b90aa9594cf6be842afa3ddf074be5'
            'f26db42be78c372a6063426cf2c09169066663ac35c096a90411855daad61e3bf5d265232204a0141611280b73677ce34e71179c05d5b23fbf266148c355f83f')

package(){
	cd "${srcdir}"
	install -Dm644  LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
        install -Dm 644 "${_pkgname}.service" -t "$pkgdir/usr/lib/systemd/system/"
        install -Dm 644 "${_pkgname}.sysusers"   "$pkgdir/usr/lib/sysusers.d/${_pkgname}.conf"
        install -Dm 644 "${_pkgname}.tmpfiles"   "$pkgdir/usr/lib/tmpfiles.d/${_pkgname}.conf"
 	install -Dm644  *.example -t "${pkgdir}/opt/${_pkgname}/"

}

