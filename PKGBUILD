# Maintainer: Paolo Giangrandi <paolo@luccalug.it>

pkgname=nodejs-latest-bin
pkgver=9.11.0
pkgrel=1
pkgdesc='JavaScript runtime'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://nodejs.org/'
license=('MIT')
provides=("nodejs=${pkgver}" 'npm')
conflicts=('nodejs' 'npm')

declare -A archmap=( ['i686']='x86' ['x86_64']='x64' ['armv6h']='armv6l' ['armv7h']='armv7l' ['aarch64']='arm64' )
NODE_ARCH="${archmap[$CARCH]}"

source_i686=("https://nodejs.org/dist/v${pkgver}/node-v${pkgver}-linux-${NODE_ARCH}.tar.xz")
source_x86_64=("https://nodejs.org/dist/v${pkgver}/node-v${pkgver}-linux-${NODE_ARCH}.tar.xz")
source_armv6h=("https://nodejs.org/dist/v${pkgver}/node-v${pkgver}-linux-${NODE_ARCH}.tar.xz")
source_armv7h=("https://nodejs.org/dist/v${pkgver}/node-v${pkgver}-linux-${NODE_ARCH}.tar.xz")
source_aarch64=("https://nodejs.org/dist/v${pkgver}/node-v${pkgver}-linux-${NODE_ARCH}.tar.xz")

sha256sums_i686=('a4349420b74804b3404a4eea27341297968f61998b01f6504dbbad603700e944')
sha256sums_x86_64=('a4349420b74804b3404a4eea27341297968f61998b01f6504dbbad603700e944')
sha256sums_armv6h=('a4349420b74804b3404a4eea27341297968f61998b01f6504dbbad603700e944')
sha256sums_armv7h=('a4349420b74804b3404a4eea27341297968f61998b01f6504dbbad603700e944')
sha256sums_aarch64=('a4349420b74804b3404a4eea27341297968f61998b01f6504dbbad603700e944')

package() {
	cd "node-v${pkgver}-linux-${NODE_ARCH}"
	
	install -D -m644 'LICENSE' "$pkgdir"/usr/share/licenses/nodejs/LICENSE
	
	install -dm755 "$pkgdir/usr"
	cp -r 'bin' 'include' 'lib' 'share' "$pkgdir/usr/"
}
