# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

_pkgname=reredirect
pkgname=${_pkgname}-git
pkgver=v0.1.r5.ga80845a
pkgrel=1
pkgdesc="Tool to dynamicly redirect outputs of a running process"
arch=(i686 x86_64)
url="https://github.com/jerome-pouiller/${_pkgname}/"
license=('custom')
source=("${_pkgname}::git+git://github.com/jerome-pouiller/${_pkgname}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
 
build() {
  cd "$srcdir/${_pkgname}"
  make
}
 
package() {
  cd "$srcdir/${_pkgname}"
  make PREFIX=/usr DESTDIR=${pkgdir} install
}