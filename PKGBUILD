# Contributor: Carlo Casta <carlo.casta@gmail.com>
# Contributor: Corinne Schrickel <corinne.schrickel@gmail.com>
# Contributor: Alexander Dusheleit <alexander.duscheleit@gmail.com>

pkgname=gkrellm-gkfreq
pkgver=1.3
pkgrel=1
pkgdesc="A plugin for gkrellm2 which displays the current CPU frequency"
arch=('i686' 'x86_64')
url="http://code.google.com/p/gkrellm-gkfreq"
license=('GPL')
depends=('gkrellm')
makedepends=('pkgconfig')
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('26c96bce1d27fd1ec4b67eaa172cc2c3')

build()
{
	cd "$srcdir/$pkgname"
	make
}

package()
{
	cd "$srcdir/$pkgname"
	install -D -m 755 gkfreq.so ${pkgdir}/usr/lib/gkrellm2/plugins/gkfreq.so
}
