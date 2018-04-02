# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Marti Raudsepp <marti@juffo.org>

pkgname=namebench
pkgver=1.3
pkgrel=1
pkgdesc='Open-source DNS benchmark utility'
arch=(any)
url='http://code.google.com/p/namebench/'
license=(Apache)
depends=(python2-dnspython python2-httplib2 python2-simplejson python2-jinja
         python2-graphy)
makedepends=(git)
optdepends=('tk: gui'
            'python2-pmw: gui')
source=(namebench::git+https://github.com/google/${pkgname}.git#branch=${pkgver})
sha512sums=('SKIP')

package() {
  cd namebench
  export NO_THIRD_PARTY=true
  python2 setup.py install --root="${pkgdir}"
  cd "${pkgdir}/usr"
  mkdir share
  mv namebench share
}
