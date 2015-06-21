# Maintainer: Jakob Gruber (jakob dot gruber at kabelnet dot at)

_pkgname="mkwvconf" 
pkgname="$_pkgname-git"
pkgver=0.1
pkgdesc="Automatically generate a wvdial configuration for mobile broadband devices."
pkgrel=1
arch=('any')
url="http://github.com/schuay/mkwvconf"
license=('GPL')
depends=('mobile-broadband-provider-info' 'python2' 'pyxml')
makedepends=('git')

build() {
  rm -rf "${srcdir}/*"

  cd "${srcdir}"
  git clone git://github.com/schuay/mkwvconf.git
}

package() {
  cd "${srcdir}/$_pkgname"
  install -Dm755 mkwvconf.py "${pkgdir}/usr/bin/mkwvconf"
}

