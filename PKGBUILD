# Contributor: Carlo Casta <carlo.casta@gmail.com>

pkgname=gkrellm-nvidia
pkgver=1.2
pkgrel=1
pkgdesc="A plugin for gkrellm2 which displays nVidia GPU status"
arch=('i686' 'x86_64')
url="https://github.com/carcass82/gkrellm-nvidia"
license=('GPL')
depends=('gkrellm' 'nvidia-utils')
makedepends=('pkgconfig')
source=(https://github.com/carcass82/$pkgname/archive/release-$pkgver.tar.gz)
sha256sums=('852ff07407870ac87f1e0ed736724ecd3fcf44601ddfcd5a7157da665fbf79e4')

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
