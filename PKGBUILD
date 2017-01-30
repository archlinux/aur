# Maintainer: M0Rf30

pkgname=nodejs6-bin
pkgver=6.9.4
pkgrel=1
pkgdesc='v6 of nodejs evented I/O for V8 javascript'
arch=('i686' 'x86_64')
url='http://nodejs.org/'
license=('MIT')
depends=('openssl' 'zlib' 'icu' 'libuv' 'http-parser' 'c-ares')
makedepends=('python2' 'procps-ng')
optdepends=('npm: nodejs package manager')
conflicts=('nodejs' 'nodejs6')
provides=('nodejs' 'nodejs6' 'npm')
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

md5sums_i686=('664af4b372faea057aed9f349b66f9a3')
md5sums_x86_64=('faeb2252f7d01e28b4a7d1b8b6fa3c53')
