# Maintainer: TommyJerryMairo <tjm@member.fsf.org>
pkgname=reciteword
pkgver=0.8.6
pkgrel=7
pkgdesc="Reciteword is an educational software that helps Chinese natives learn English, especially in vocabulary enrichment. It claims to embrace la interfaz gráfica de usuario bonita. It also claims that learners are to enjoy English learning with reciteword."
arch=("x86_64")
url="https://sourceforge.net/projects/reciteword/"
depends=("gtk2" "esound" "glib2" "espeak" "wyabdcrealpeopletts")
license=('GPL')
provides=("reciteword")
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=("ac0f763cafab1884a58c031154bf4dbad6e5579d7814995457cbfe4bdc56f6c1")


build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
