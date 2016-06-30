# Maintainer: Sam Stuewe <halosghost at archlinux dot info>

pkgname=hashcat
pkgver=3.00
pkgrel=1
pkgdesc='A multithreaded cross platform hash cracker.'
arch=('i686' 'x86_64')
url='https://hashcat.net/hashcat'
depends=('gmp' 'opencl-headers')
license=('MIT')
source=("https://codeload.github.com/$pkgname/$pkgname/tar.gz/v$pkgver")
validpgpkeys=('A70833229D040B4199CC00523C17DA8B8A16544F')
md5sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX='/usr' install
}

# vim:set ts=2 sw=2 et:
