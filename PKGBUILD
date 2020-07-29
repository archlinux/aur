# Maintainer: genofire <geno+dev@fireorbit.de>

pkgname=purple-mm-sms
_pkgname=purple-mm-sms
pkgver=0.0.4
pkgrel=1
pkgdesc="Purple SMS plugin using ModemManager"
url="https://source.puri.sm/Librem5/purple-mm-sms"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
depends=('libpurple' 'libmm-glib' 'modemmanager')
provides=('purple-mm-sms' 'libpurple-mm-sms' 'purple-mm-sms-git' 'libpurple-mm-sms-git')
source=("https://source.puri.sm/Librem5/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha512sums=('37b4296d5c677897cb4ff0d6f22a077814eb1af2e2985570f2cd4190a317f0292aaa5302b71c5bd54bd5de9d351ce1372599c715a45638ef1ce7ba2f97b0eae3')

build() {
	cd "$srcdir/${_pkgname}-v${pkgver}"
	make
}

package() {
	cd "$srcdir/${_pkgname}-v${pkgver}"
	make DESTDIR="${pkgdir}" install
}
