# Maintainer: robertfoster

pkgname=nodejs6-bin
pkgver=6.14.3
pkgrel=1
pkgdesc='v6 of nodejs evented I/O for V8 javascript'
arch=('i686' 'x86_64')
url='http://nodejs.org/'
license=('MIT')
depends=('openssl' 'zlib' 'icu' 'libuv' 'http-parser' 'c-ares')
makedepends=('python2' 'procps-ng')
optdepends=('npm: nodejs package manager')
conflicts=('nodejs' 'nodejs6')
provides=("nodejs=$pkgver" 'nodejs6' 'npm')
source_i686=("https://nodejs.org/dist/v$pkgver/node-v$pkgver-linux-x86.tar.xz")
source_x86_64=("https://nodejs.org/dist/v$pkgver/node-v$pkgver-linux-x64.tar.xz")

package() {
  if [ "$CARCH" = "x86_64" ]; then

        # x86_64 Systems
	cd node-v$pkgver-linux-x64
    else

        # i686 Systems
	cd node-v$pkgver-linux-x86
    fi
    mkdir $pkgdir/usr
    cp -r {bin,include,lib,share} $pkgdir/usr 
    install -D -m644 LICENSE \
    "$pkgdir"/usr/share/licenses/nodejs/LICENSE
}

md5sums_i686=('eadd77995fec9e47c0d3dec8b1a2d62f')
md5sums_x86_64=('d70486160f458162588f6af470157e9a')
