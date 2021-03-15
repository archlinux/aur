pkgname=nodejs-nightly
_pkgver=16.0.0-nightly2021031566f0eb7dc3
# replace - with .
pkgver=16.0.0.nightly2021031566f0eb7dc3
pkgrel=1
pkgdesc='Nightly version of nodejs evented I/O for V8 javascript'
arch=('x86_64')
url='http://nodejs.org/'
license=('MIT')
depends=('openssl' 'zlib' 'icu' 'libuv' 'http-parser' 'c-ares')
makedepends=('procps-ng')
conflicts=('nodejs' 'npm')
provides=("nodejs=$pkgver" 'nodev16' 'npm')
source=("https://nodejs.org/download/nightly/v${_pkgver}/node-v${_pkgver}-linux-x64.tar.xz")
md5sums=('84a306c0e725bef9b0818861055cf037')

package() {
  	cd node-v$_pkgver-linux-x64
	mkdir $pkgdir/usr
	cp -r {bin,include,lib,share} $pkgdir/usr
	install -D -m644 LICENSE \
		"$pkgdir"/usr/share/licenses/nodejs/LICENSE
}
