# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=chk4mail
pkgver=2.25
pkgrel=1
pkgdesc="A CLI utility, which quickly checks multiple folders for new mail"
arch=('i686' 'x86_64')
url="ftp://ftp.stack.nl/pub/users/johans/chk4mail/"
license=("custom: MIT") 
source=(ftp://mud.stack.nl/pub/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('a9c26e4a05511b510577799060837994')

build()  {
  cd ${srcdir}/$pkgname-$pkgver

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install

# license
  install -D COPYING ${pkgdir}/usr/share/licenses/$pkgname/COPYING || return 1
}
