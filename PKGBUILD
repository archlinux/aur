# Maintainer: Paolo Giangrandi <paolo@luccalug.it>

pkgname=nodejs-latest-bin
pkgver=9.1.0
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

sha256sums_i686=('3ba6004a276aee384ee6fbf5cb5c0465c00733299adbe477afdbb1d76767aa36')
sha256sums_x86_64=('b796ed115c97acd23211c294129b0a834ff3a6a0f583111443b89d2b24e0d4d9')
sha256sums_armv6h=('a182800ab92e21ed867c44b352b2f01ac7c629d842b0f42426e0a81681bc1078')
sha256sums_armv7h=('7f504a6057f13b71c9a73d6445dd3fe4a4282a4e86efedd1baf5e60a9d535d7d')
sha256sums_aarch64=('37d329fa06b22e30243c503b64d9666d56abb6c0ce903251d4b43e7ad0833fb3')

package() {
	cd "node-v${pkgver}-linux-${NODE_ARCH}"
	
	install -D -m644 'LICENSE' "$pkgdir"/usr/share/licenses/nodejs/LICENSE
	
	install -dm755 "$pkgdir/usr"
	cp -r 'bin' 'include' 'lib' 'share' "$pkgdir/usr/"
}
