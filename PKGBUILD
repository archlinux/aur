# Maintainer: Patrick Ulbrich <zulu99 at gmx . net>
# Contributor: kaptoxic at yahoo com

pkgname=mailnag-gnome-shell
pkgver=3.16.0
pkgrel=1
pkgdesc="Mailnag GNOME-Shell extension"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/pulb/mailnag-gnome-shell"
license=('GPL')
depends=('gnome-shell>=3.16' 'mailnag' 'folks')
makedepends=('vala')
source=('https://github.com/pulb/mailnag-gnome-shell/archive/v3.16.0.tar.gz')
md5sums=('d2d9a6403095844c764c3c52973bc18b')
install='mailnag-gnome-shell.install'

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make prefix="$pkgdir"/usr install
 	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
