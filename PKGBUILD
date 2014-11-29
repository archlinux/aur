# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=chk4mail
pkgver=2.27
pkgrel=1
pkgdesc="A CLI utility, which quickly checks multiple folders for new mail"
arch=('i686' 'x86_64')
url="http://freecode.com/projects/chk4mail"
license=('custom: MIT') 
source=(ftp://ftp.stack.nl/pub/users/johans/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('d5b3d8f48a1180b58081b4a223f35f59')

build()  {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

# license
  install -D COPYING "${pkgdir}"/usr/share/licenses/$pkgname/COPYING
}
