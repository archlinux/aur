# Contributor: Carlo Casta <carlo.casta@gmail.com>

pkgname=gkrellm-nvidia
pkgver=1.3
pkgrel=1
pkgdesc="A plugin for gkrellm2 which displays nVidia GPU status"
arch=('i686' 'x86_64')
url="https://github.com/carcass82/gkrellm-nvidia"
license=('GPL')
depends=('gkrellm' 'nvidia-utils')
makedepends=('pkgconfig')
source=(https://github.com/carcass82/$pkgname/archive/release-$pkgver.tar.gz)
sha256sums=('80bcd6621bee1cf646309eaa0b35ee16e69dec0ffc4c5bdbce9b7f05df578823')

build()
{
	cd "$srcdir/$pkgname-release-$pkgver"
	LDFLAGS="" make
}

package()
{
	cd "$srcdir/$pkgname-release-$pkgver"
	install -D -m 755 nvidia.so ${pkgdir}/usr/lib/gkrellm2/plugins/nvidia.so
}
