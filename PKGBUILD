# Maintainer: Patrick Lühne <patrick-arch@luehne.de>
pkgname=plasp
pkgver=3.1.1
pkgrel=1
pkgdesc='ASP planning tools for PDDL'
arch=('x86_64' 'i686')
url='https://github.com/potassco/plasp'
license=('MIT')
makedepends=('cmake')
source=("https://github.com/potassco/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-source.tar.gz")
sha512sums=('0df9f6a29a9924664a8e41c8939a0702a8980168145f480dbfa56359f4203b1a799f47996eba445d9fc2e9fce884f0f4bd3a4d5a977f47bc7dce68e38d2ba027')

build() {
	cd ${pkgname}-${pkgver}
	mkdir build
	cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd ${pkgname}-${pkgver}
	install -D build/bin/${pkgname} ${pkgdir}/usr/bin/${pkgname}
	install -D -m644 README.md -t ${pkgdir}/usr/share/doc/${pkgname}
	install -D -m644 LICENSE.md -t ${pkgdir}/usr/share/licenses/${pkgname}
}
