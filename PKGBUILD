# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Pranay Kanwar <warl0ck@metaeye.org>
pkgname=stan
pkgver=0.4.1
pkgrel=3
pkgdesc="Stream analyzer intended for reverse engineering and cryptographic analysis."
arch=('i686' 'x86_64')
url="https://web.archive.org/web/20130507102710/http://www.roqe.org/stan/"
license=('custom')
depends=('glibc')
source=("https://web.archive.org/web/20130507102710/http://www.roqe.org/stan/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cfd954daf5e470fbb58294fc68e3a27e6e70e142cbdcbb13e9fcac4e0eff30c8')

build() {
	cd ${pkgname}-${pkgver}
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

