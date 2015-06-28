# Contributor: Sara <sara at archlinux dot us>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=wakeup-git
pkgver=49db7f6
pkgrel=1
pkgdesc="A timer that will wake your system from suspend to RAM."
arch=('i686' 'x86_64')
url="https://github.com/fogobogo/wakeup"
license=('GPL')
depends=('linux-api-headers' 'pm-utils')
makedepends=('git')
provides=('wakeup')
conflicts=('wakeup')
source=("$pkgname::git+https://github.com/fogobogo/wakeup.git")
md5sums=('SKIP')

pkgver(){
  cd "${srcdir}/$pkgname"
  git describe --always | sed 's|-|.|g'
}

build(){
  cd "${srcdir}/${pkgname}"
  make
}

package(){
  cd "${srcdir}/${pkgname}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

