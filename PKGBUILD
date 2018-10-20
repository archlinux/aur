# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=hyx
pkgver=0.1.5
pkgrel=1
pkgdesc='A minimalistic, but powerful console hex editor'
url='https://yx7.cc/code/'
license=('MIT')
depends=('glibc')
source=("https://yx7.cc/code/hyx/hyx-${pkgver}.tar.xz")
sha512sums=("79c45c7b3007af4009c356d3b4c7c8b29e241f07311ef62ffea09e0d31e58741093b1375e352800e6f6d9c1d67095b16c68ce3d58d79b05817513130dbfb1b1e")
arch=('i686' 'x86_64')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 'license.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

