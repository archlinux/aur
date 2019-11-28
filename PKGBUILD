# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname="python2-revolut"
_projname="revolut-python"
pkgver=0.6.1
pkgrel=1
pkgdesc='Revolut API client for Python'
license=('BSD')
arch=('any')
url='https://github.com/emesik/revolut-python'
makedepends=('python2' 'python2-distribute')
depends=('python2' 'python2-requests' 'python2-dateutil' 'python2-pyjwt')
source=("https://github.com/emesik/${_projname}/archive/v${pkgver}.tar.gz")
md5sums=('1b5b117b66020d68c5ac8a491b802ffa')

build() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv ${pkgdir}/usr/bin/revolut_genkey{,2}.sh
  mv ${pkgdir}/usr/bin/revolut_getjwt{,2}.py
  mv ${pkgdir}/usr/bin/revolut_gettokens{,2}.py
}
