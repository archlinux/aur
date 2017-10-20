# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='opendoas'
pkgver='6.0'
pkgrel='1'
pkgdesc='Run commands as super user or another user, alternative to sudo'
arch=('x86_64' 'i686')
url="https://github.com/Duncaen/OpenDoas"
license=('custom:ISC')
depends=('pam')
conflicts=('opendoas-git')
install=opendoas.install
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('2bf5e00895a45d87785e7a494a1506844afd843ef5375e0b0e3795ebc24712bb941c6feeb87e426e41a240d40aca9b4c099f77220745bb7142a7a4b303441f60')

build() {
	cd "OpenDoas-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "OpenDoas-${pkgver}"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
