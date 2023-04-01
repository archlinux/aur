# Maintainer: Pavel Sibal <entexsoft@gmail.com>
pkgname=bleachbit-admin
pkgver=0.1
pkgrel=0
pkgdesc="Run bleachbit as root for cleaning system files. Patched version."
arch=('any')
url="https://www.bleachbit.org/"
license=('GPL3')
provides=("${pkgname}")
conflicts=("${pkgname}" 'bleachbit-cli' 'bleachbit-root')
depends=('bleachbit' 'polkit')
options=('!strip')

source=('https://gitlab.com/linux-stuffs/bleachbit-admin/-/raw/main/distrib/bleachbit-admin-0.1-0.tar.gz')
sha256sums=('SKIP')

package() {
	cd "${srcdir}/${pkgname}"
	./configure  --prefix=/usr
	make install DESTDIR="${pkgdir}"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp --no-preserve=ownership "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
