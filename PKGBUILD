# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname='uniscan'
pkgver='6.2'
pkgrel=1
pkgdesc="A remote file include, local file include and remote command execution vulnerability scanner"
arch=('any')
url='https://sourceforge.net/projects/uniscan/'
license=('GPL2')
depends=('perl-moose' 'perl-tk')
source=('http://http.kali.org/kali/pool/main/u/uniscan/uniscan_6.2-1kali0_all.deb')
sha256sums=('84501cd894b89cb70c42edb32a27c4b19fba1b1044e8332a8fdddc3bada29ec4')

prepare() {
	cd "${srcdir}"
	tar xf data.tar.gz
}

package() {
	cd "${srcdir}"
	install -dm755 "${pkgdir}/usr/share/"
	cp -rf usr/share/* "${pkgdir}/usr/share"
	install -dm755 "${pkgdir}/usr/bin"
	cp usr/bin/* "${pkgdir}/usr/bin/"
}
