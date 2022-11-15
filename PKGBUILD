# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: froggie <sullivanva@gmail.com>

pkgname=pstotext
pkgver=1.9
pkgrel=7
pkgdesc="Converts Postscript to text"
arch=('x86_64')
url="https://www.cs.wisc.edu/~ghost/doc/pstotext.htm"
license=('GPL')
depends=('ghostscript')
source=(ftp://ftp.netbsd.org/pub/pkgsrc/distfiles/$pkgname-$pkgver.tar.gz)
md5sums=('64576e8a10ff5514e285d98b3898ae78')
sha256sums=('cfe0a251d0d43982a7d3bdf1d1670c854432739d00cb593c9beaca4b2cc36c27')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  install -Dm755 pstotext "$pkgdir"/usr/bin/pstotext
  install -Dm644 pstotext.1 "$pkgdir"/usr/share/man/man1/pstotext.1
}
