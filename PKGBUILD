# Maintainer: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Cedric Girard <girard.cedric@gmail.com>

pkgname=lib32-proxychains-ng
pkgver=4.10
pkgrel=1
pkgdesc="A hook preloader that allows to redirect TCP traffic of existing dynamically linked programs through one or more SOCKS or HTTP proxies (32-bit version)"
arch=('x86_64')
url="https://github.com/rofl0r/proxychains"
license=('GPL')
provides=('lib32-proxychains')
replaces=('lib32-proxychains')
conflicts=('lib32-proxychains')
depends=('glibc' 'proxychains-ng')
source=("http://downloads.sourceforge.net/project/proxychains-ng/proxychains-$pkgver.tar.bz2")
md5sums=('19442655ea290b18dcccf30fc4ae3e74')

build() {
  cd proxychains-$pkgver
  export CFLAGS=-m32 LDFLAGS=-m32
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd proxychains-$pkgver
  install -Dm0755 libproxychains4.so "$pkgdir/usr/lib32/libproxychains4.so"
}

# vim:set ts=2 sw=2 et:
