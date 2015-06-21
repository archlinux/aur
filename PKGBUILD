# Maintainer: Jakob Gruber (jakob dot gruber at kabelnet dot at)
 
_pkgname="mobile-broadband-provider-info"
pkgname="${_pkgname}-git"
pkgver=20120129
pkgdesc="Mobile broadband provider database."
pkgrel=1
arch=('any')
provides=('mobile-broadband-provider-info')
conflicts=('mobile-broadband-provider-info')
url="http://git.gnome.org/cgit/mobile-broadband-provider-info/"
license=('custom')
makedepends=('git')

build() {
  cd ${srcdir}

  rm -rf "${srcdir}/${_pkgname}"
  git clone git://git.gnome.org/${_pkgname}
}

package() {
  cd ${srcdir}/${_pkgname}

  mkdir -p ${pkgdir}/usr/share/{,doc/}${_pkgname}/
  install -m644 \
        README.svn \
        ChangeLog \
        NEWS \
        authors.svn2cl \
        MAINTAINERS \
        README \
        "${pkgdir}/usr/share/doc/${_pkgname}/"
  install -m644 \
        serviceproviders.2.dtd \
        serviceproviders.xml \
        "${pkgdir}/usr/share/${_pkgname}/"
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

