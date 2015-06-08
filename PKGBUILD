# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

_pkgname=pivaders
pkgname=pivaders-git
pkgver=0.2.r1.g5bffd90
pkgrel=1
pkgdesc="Space Invaders game"
arch=('any')
url="https://github.com/russb78/${_pkgname}"
license=('GPL2')
depends=('python' 'python2-pygame')
conflicts=('pivaders')
source=("${_pkgname}::git+git://github.com/russb78/${_pkgname}.git"
        "${_pkgname}.sh")
sha1sums=('SKIP'
          '60183ae638d48bc5493eb318e54fb61a6454cfa3')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
 
package() {
  install -Dm755 "${srcdir}/${_pkgname}.sh" ${pkgdir}/usr/bin/${_pkgname}
  mkdir -p ${pkgdir}/usr/share/${_pkgname}
  cp -r ${srcdir}/${_pkgname}/${_pkgname}/* ${pkgdir}/usr/share/${_pkgname}/
}
