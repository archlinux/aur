# Maintainer: Reventlov <contact+aur@volcanis.me>
pkgname=python2-privilege
pkgver=1.1
pkgrel=1
pkgdesc="Securely drop privileges from root to another user"
arch=('any')
license=('BSD')
url="https://pypi.python.org/pypi/privilege/1.0"
makedepends=('python2')
depends=('python2')
source=("http://www.subspacefield.org/security/privilege/code/privilege/privilege-${pkgver}.tar.gz" "LICENSE")
md5sums=('6e9db77fcd7ad3c73196b8ce55c3067d'
         '314649d8ba9dd7045dfb6683f298d0a8')

package() {
  cd "${srcdir}"/privilege-${pkgver}
  python2 setup.py  install --root="$pkgdir/" --optimize=1
  install -D -m644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  sed -i 's|#! /usr/bin/python|#! /usr/bin/env python2|' "${pkgdir}/usr/lib/python2.7/site-packages/privilege.py"
}
