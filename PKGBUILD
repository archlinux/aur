# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: uvok <uvok at online dot de>
# Contributor: Urist <9362773 at gmail.com>

pkgname=bti
pkgver=034
pkgrel=1
pkgdesc='Console client for Twitter and identi.ca'
arch=('x86_64')
url='http://gregkh.github.com/bti/'
license=('GPL')
depends=('pcre' 'libxml2' 'curl' 'liboauth' 'json-c')
source=(http://www.kernel.org/pub/software/web/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('8b4a1a11f529f83956468acadaea9d11db4f03e82afe07fecb84b2d00e9eae83')

build() {
  cd "${srcdir}"/$pkgname-$pkgver
  ./configure --prefix=/usr

  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver
  
  make DESTDIR="${pkgdir}" install
}
