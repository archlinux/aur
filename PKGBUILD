# Maintainer: Pavel Sibal <entexsoft@gmail.com>
pkgname=bash-conf
pkgver=0.1
pkgrel=9
pkgdesc="Bash Configurator is utility which simplifying the bash prompt configuration"
arch=('any')
url="https://gitlab.com/linux-stuffs/bash-conf"
license=('GPL3')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('bash' 'libnewt' 'coreutils' 'grep' 'sed')
optdepends=('nano' 'screenfetch')
options=('!strip' '!emptydirs')

source=('https://gitlab.com/linux-stuffs/bash-conf/raw/master/distrib/bash-conf-0.1-9.tar.gz')
sha256sums=('SKIP')

package() {
	cd "${srcdir}/${pkgname}"
	./configure  --prefix=/usr
	make install DESTDIR="${pkgdir}"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp --no-preserve=ownership "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
