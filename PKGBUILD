# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=rpc2
pkgver=2.10
pkgrel=4
pkgdesc="Remote procedure call package for IP/UDP"
arch=(x86_64)
url="http://www.coda.cs.cmu.edu"
license=("LGPL")
depends=('lwp' 'readline')
validpgpkeys=('477F78AA863A90A623664AA1CE0D7E10997007A2')
source=(http://www.coda.cs.cmu.edu/pub/rpc2/src/rpc2-$pkgver.tar.gz{,.asc})
sha256sums=('b381f0a51aab470f4698f0143cf04b22c64e9176d6e4f11c0a50d28b3169fa07'
            'SKIP')

build() {
  cd "$srcdir"/rpc2-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/rpc2-$pkgver
  make DESTDIR="$pkgdir" install
}
