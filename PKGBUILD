# Maintainer: TommyJerryMairo <tjm@member.fsf.org>
pkgname=reciteword
_pkgver=0.8.7-3
pkgver="${_pkgver%-[[:digit:]]*}"
pkgrel=1
pkgdesc="Reciteword is an educational software that helps Chinese natives learn English, especially in vocabulary enrichment. It claims to embrace la interfaz gráfica de usuario bonita. It also claims that learners are to enjoy English learning with reciteword."
arch=("x86_64")
url="https://sourceforge.net/projects/reciteword/"
depends=("gtk2" "esound" "glib2" "espeak" "wyabdcrealpeopletts")
license=('GPL')
provides=("reciteword")
source=("https://master.dl.sourceforge.net/project/reciteword/reciteword/${pkgver}/reciteword-${_pkgver}.tar.xz")
sha256sums=('98f1464b887fe65ad4ae8c153ce60a516c1a8ff456162c4cb98707fbf7a321d9')


build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
