# Maintainer: Pablo Moyano (p4block)
_pkgname=radeonjet
pkgname=radeonjet-git
pkgver=15.b3d58ef
pkgrel=1
pkgdesc="A simple bash wrapper around AMDGPU's overclocking support"
arch=('any')
url="https://github.com/p4block/radeonjet"
license=('GPL3')
makedepends=('git')
provides=('radeonjet')
conflicts=('radeonjet')
source=("git+https://github.com/p4block/$_pkgname.git")
md5sums=('SKIP') 

pkgver() {
    cd ${srcdir}/${_pkgname}
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "${srcdir}/${_pkgname}"
  
  install -Dm755 radeonjet "${pkgdir}/usr/bin/radeonjet"
}
