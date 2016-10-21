pkgname=alpm_octopi_utils
pkgver=1.0.0
pkgrel=1
_commit=6d93c06d0feec0df7e5958c33df281eda91a6700
pkgdesc="Alpm utils for Octopi"
url="https://octopiproject.wordpress.com/"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('vala')
source=("https://github.com/aarnt/${pkgname}/archive/${_commit}.zip")
sha256sums=('637ce5f534b54576c0e68d22892ba920c61a95d32cb5166633e0a93d325e84d4')
         
build() {
  cd ${pkgname}-${_commit}
  
  make
}

package() {
  cd ${pkgname}-${_commit}
  
  install -D -m755 src/libalpm_octopi_utils.so ${pkgdir}/usr/lib/libalpm_octopi_utils.so
  install -D -m644 src/libalpm_octopi_utils.pc ${pkgdir}/usr/lib/pkgconfig/libalpm_octopi_utils.pc
  install -D -m644 src/alpm_octopi_utils.h ${pkgdir}/usr/include/alpm_octopi_utils.h   
}

# vim:set ts=2 sw=2 et:
