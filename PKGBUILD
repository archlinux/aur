# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: lolilolicon #<moc.liamg@nocilolilol>.reverse

pkgname=libutf8proc-julia
pkgver=2.1.0
pkgrel=1
pkgdesc='C library for processing UTF-8 encoded Unicode strings'
arch=('x86_64' 'i686')
url='http://julialang.org/utf8proc/'
license=('custom')
depends=('glibc')
makedepends=('git')
conflicts=('libutf8proc')
replaces=('libutf8proc')
source=($pkgname-$pkgver.tar.gz::"https://github.com/JuliaLang/utf8proc/archive/v$pkgver.tar.gz"
        'libutf8proc.pc')
md5sums=('8ec2f58a12b3cec857881360b2b99952'
         'b2f769f102e4331bd2ce1313ac53d143')

build() {
  cd utf8proc-$pkgver
  make
}

package() {
  cd utf8proc-$pkgver

  make install prefix=/usr DESTDIR="$pkgdir"

  install -Dm644 ../libutf8proc.pc "$pkgdir/usr/lib/pkgconfig/libutf8proc.pc"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

# vim:set ts=2 sw=2 et:
