# Contributor: Carlo Casta <carlo.casta@gmail.com>

pkgname=gkrellm-nvidia
pkgver=1.0.2
pkgrel=1
pkgdesc="A plugin for gkrellm2 which displays nVidia GPU status"
arch=('i686' 'x86_64')
url="https://github.com/carcass82/gkrellm-nvidia"
license=('GPL')
depends=('gkrellm' 'libxnvctrl')
makedepends=('pkgconfig')
source=(https://github.com/carcass82/$pkgname/archive/release-$pkgver.tar.gz)
sha256sums=('a9891135eaeab370e23e0a0350550ca1bd51b7b2a35e26d03e4428e6920b3680')

build()
{
	cd "$srcdir/$pkgname-release-$pkgver"
	make
}

package()
{
	cd "$srcdir/$pkgname-release-$pkgver"
	install -D -m 755 nvidia.so ${pkgdir}/usr/lib/gkrellm2/plugins/nvidia.so
}
