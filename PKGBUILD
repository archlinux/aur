# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='salvador'
pkgver='2.1.2'
pkgrel='1'
pkgdesc='A bash script that will help you maintain your AUR packages'
arch=('any')
url="https://gitlab.com/dpeukert/$pkgname"
license=('GPL3')
depends=('git' 'pacman-contrib' 'perl')
optdepends=(
	'curl: nvchecker functionality'
	'jq: nvchecker functionality'
	'nvchecker: nvchecker functionality'
)
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('18ced36a7c1c706ded252295757c85efa588554f5bab0697ea80ed42f205bd9b3a37fc4ef685d934f0daf1b0727183d5adf723df2caaaac1619ad1544ac6511b')

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
