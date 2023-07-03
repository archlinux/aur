# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname='vtunerc-dkms'
pkgdesc='Kernel module to create virtual DVB devices'
pkgver=1.4
pkgrel=13
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='http://code.google.com/p/vtuner'
license=('GPL2')
depends=('linux>=3.3' 'dkms')
conflicts=('vtuner-module' 'vtuner-module-lts')
source=("vtuner.linux-driver-rel${pkgver}.tar.gz::https://github.com/lecotex/vtuner.linux-driver/archive/rel${pkgver}.tar.gz"
        '0001-Replace-make-old-syntax.patch'
        '0002-Replace-Z-with-z.patch'
        '0003-Tweaks.patch'
        '0004-Fix-Waddress-warning.patch'
        '0005-Kernel-3.10.patch'
        '0006-Kernel-4.2.patch'
        '0007-Kernel-4.6.patch'
        '0008-Kernel-4.15.patch'
        '0009-Kernel-4.16.patch'
        '0010-Kernel-4.19.patch'
        '0011-Kernel-5.3.patch'
        '0012-Kernel-5.6.patch'
        '0013-Kernel-5.17.patch'
        '0014-Kernel-6.4.patch'
        '93-vtunerc.rules'
        'dkms.conf')
sha256sums=('c6ba0cfd808e3f8473a5ea25d4ac2871b826edc62de5f3624c0bd812aad63bc1'
            '8c6b167f96649fab61a1ff93f8e2de0836b6b62c8e931e61cb4d7db0d1749891'
            '0454962fdd469ee3b7e0f8bf6424815fae868bc690ad3d8678aa21074c8b0a67'
            'c6f9dffb930df9bec270d3b35e85162b05fc0d787706d8204e8256633676982e'
            'ccb5504068826b4f75724c4d4a00ad7fac5ca86ee4adab9f1b96a641bc958d8d'
            '9da76c43712339fd3f65f34b624d47399f448684e843c3fe47e048ee4d51acc5'
            '1252bc9ba0b15d0b4bf4f77aba934b48fe9ac9151db0ebc3a8f260f6de868b0d'
            '52e6e5041c935ec0d432b89818da0a4bf524451326acae84a85f3aa4c4d1f538'
            '05a915611395964bbfd5c1e8de15e4c810756aac1de8e0d499e98993b27566db'
            '00e55ce1185099f0ad757f98d3ce0da238114987ea8639c3a6e1f0a649cbbb3f'
            'f9226fb2b6ad805698090448b9c1e67716c58c6c8317f70ae3a073beebb88366'
            '4d32789ead0ee2c2ec4aaf1014ddf0bc3e084c0f580f960e61210591995df785'
            'bfe467a73435391c0a24c58199fd440482d80dfa15f7648dcf72767a878c7f9e'
            '6a52ae33b2d2b93001b00a2c1d34cb02327d35a487ca09a85ad3ecde59acc9d2'
            'd8f24969ceb8c3cc3ba418c392dc67cfb25d34a233dc11fac67c55641d672bba'
            '4b2d860cac8c8bab2d8fa79760d4405bef6fd042f4e78b680d25d1a5ebcbf83d'
            'd13cc9a2e3778dddda263159a9bde32245bb32b7166632b4cbd9f015f390825c')

package() {
	install -dm755 ${pkgdir}/usr/src/vtunerc-${pkgver}/patches
	cp \
		${srcdir}/vtuner.linux-driver-rel${pkgver}/* \
		${srcdir}/dkms.conf \
		${pkgdir}/usr/src/vtunerc-${pkgver}
	cp ${srcdir}/*.patch ${pkgdir}/usr/src/vtunerc-${pkgver}/patches
	install -Dm644 ${srcdir}/93-vtunerc.rules ${pkgdir}/usr/lib/udev/rules.d/93-vtunerc.rules
}
