# Maintainer: Alexej Kubarev <echo YWxleGVqLmt1YmFyZXZAZ21haWwuY29tCg== | base64 -d>
pkgname=bloomrpc-bin
pkgver=1.5.3
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
	'4d92cf397573b061e80686e9bfd3f01d16f7557678de4b1c0435e0187336fd7e5b7be7a4dcfdbadb0d33aab5c2dbe2d9a66a595194fd217436c32a2598b50465'
	'ab9979e497202c97195ae59d782d2905cf5bfed49f3a7216eab33404db8e9b9de4c21b4e736378add3fdf66536af11dbde67a2b99a91d0276beb83091b62fad1'
)

package() {

	tar xf data.tar.xz -C "${pkgdir}"
	patch -uN "${pkgdir}"/usr/share/applications/bloomrpc.desktop "${srcdir}"/bloomrpc.desktop.patch || return 1
}