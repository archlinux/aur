# Maintainer: robertfoster

pkgname=nodejs6-bin
pkgver=6.17.1
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

sha256sums_i686=('45bdc0ae20c8d2a4a140f5cb6c0bc7b9812ccf19c95d72bc89a40bb3403c5954')
sha256sums_x86_64=('0f88dacefc4be4709e0a9f9fe685efdfe1582a724d8f42614179c2f604c36165')
