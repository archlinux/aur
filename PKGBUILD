# Maintainer: Liang Wei <weiliang1503@yandex.com>
pkgname=gwm
pkgver=0.7.4
pkgrel=1
epoch=
pkgdesc="A modern tilling windows manager for X11"
arch=('x86_64')
url="https://sourceforge.net/projects/gsmwm/"
license=('GPL')
depends=('bash' 'libx11')
makedepends=('git')
source=("$srcdir/$pkgname-$pkgver::git://git.code.sf.net/p/gsmwm/code")
noextract=("${source[@]##*/}")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make prefix="$pkgdir/usr/" install
}
