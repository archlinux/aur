# Contributor: Carlo Casta <carlo.casta@gmail.com>
# Contributor: Corinne Schrickel <corinne.schrickel@gmail.com>
# Contributor: Alexander Dusheleit <alexander.duscheleit@gmail.com>

pkgname=gkrellm-gkfreq
pkgver=1.4
pkgrel=1
pkgdesc="A plugin for gkrellm2 which displays the current CPU frequency"
arch=('i686' 'x86_64')
url="https://github.com/carcass82/gkrellm-gkfreq"
license=('GPL')
depends=('gkrellm')
makedepends=('pkgconfig')
source=(https://github.com/carcass82/$pkgname/archive/release-$pkgver.tar.gz)
md5sums=('c5638c427a32fc8d10d807893fef2227')

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
