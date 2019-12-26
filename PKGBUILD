# Contributor: Carlo Casta <carlo.casta@gmail.com>
# Contributor: Corinne Schrickel <corinne.schrickel@gmail.com>
# Contributor: Alexander Dusheleit <alexander.duscheleit@gmail.com>

pkgname=gkrellm-gkfreq
pkgver=1.3
pkgrel=2
pkgdesc="A plugin for gkrellm2 which displays the current CPU frequency"
arch=('i686' 'x86_64')
url="https://github.com/carcass82/gkrellm-gkfreq"
license=('GPL')
depends=('gkrellm')
makedepends=('pkgconfig')
source=(https://github.com/carcass82/$pkgname/archive/release-$pkgver.tar.gz)
md5sums=('5088037e9b31958e0e8151fa124c2bcc')

build()
{
	cd "$srcdir/$pkgname-release-$pkgver"
	make
}

package()
{
	cd "$srcdir/$pkgname-release-$pkgver"
	install -D -m 755 gkfreq.so ${pkgdir}/usr/lib/gkrellm2/plugins/gkfreq.so
}
