# Maintainer: Chris Sakalis <chrissakalis@gmail.com>

pkgname=mutrace
pkgver=0.1
pkgrel=1
pkgdesc="A mutex contention measurement tool"
arch=('i686' 'x86_64')
url="http://0pointer.de/blog/projects/mutrace.html"
license=('GPL')
depends=()
source=("http://0pointer.de/public/mutrace-0.1.tar.gz" "fix_headers.patch")

md5sums=('d809ced12f4a93734b70e11ae2622508'
         '27661c625235da9f2121b325ab4b6d9b')
sha256sums=('ba16118a9279b586b0012563e74393ea75ef25ec4e3fec7125a481364efc7dd4'
            '61e0db42f2ed3c8655d3bba81bde684aea8f1fe1e1399cb98ef478d2edc13b9e')

build()
{
	cd "$srcdir/$pkgname-$pkgver"
	./configure
	patch < ../fix_headers.patch
	make
}

package()
{
	cd "$srcdir/$pkgname-$pkgver"
	make prefix="$pkgdir/usr" install
	cd "$srcdir"
}
