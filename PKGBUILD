# Maintainer: Jérémie Astor <astor.jeremie@wanadoo.fr>
pkgname=zpm-zsh
pkgver=0.1.0
pkgrel=1
pkgdesc="zsh plugin manager in ansi C."
arch=(any)
url="https://github.com/zpm-project/zpm-zsh"
license=('GPL')
source=(https://github.com/zpm-project/zpm-zsh/archive/v$pkgver.tar.gz)
md5sums=('a63830a25b92e5714477d982c983dfd7')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	git clone $(cat .gitmodules | grep "url =" | cut -d "=" -f2)
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	PREFIX="$pkgdir/usr" make install

}
