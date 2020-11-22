# Maintainer: Alexej Kubarev <echo YWxleGVqLmt1YmFyZXZAZ21haWwuY29tCg== | base64 -d>
pkgname=bloomrpc-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="GUI Client for gRPC Services"
arch=('x86_64')
url="https://github.com/uw-labs/bloomrpc"
license=(LGPL3)
depends=('gtk3' 'libxss' 'libxtst')
source=(
	"https://github.com/uw-labs/bloomrpc/releases/download/${pkgver}/bloomrpc_${pkgver}_amd64.deb"
	bloomrpc.desktop.patch
)
conflicts=('bloomrpc')

sha512sums=(
	'f392ad07e1f9ada10b7ea790cfe480fa570d0aa50fe8b4de6ed8bec91a69408c5a7e78d4ba7a3c80819fa6e37546acf06b96af4778c409a5cb2944fdee0320a2'
	'ab9979e497202c97195ae59d782d2905cf5bfed49f3a7216eab33404db8e9b9de4c21b4e736378add3fdf66536af11dbde67a2b99a91d0276beb83091b62fad1'
)

package() {

	tar xf data.tar.xz -C "${pkgdir}"
	patch -uN "${pkgdir}"/usr/share/applications/bloomrpc.desktop "${srcdir}"/bloomrpc.desktop.patch || return 1
}