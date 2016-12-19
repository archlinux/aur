# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgbase=python-urllib5
pkgname=('python-urllib5' 'python2-urllib5')
pkgname=python-urllib5
pkgver=5.0.0
pkgrel=1
pkgdesc="Yet another Python urllib"
arch=(any)
url="https://pypi.python.org/pypi/urllib5/"
license=('Python')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/3e/90/c4d4817e3265bb292e272923d5b7930991a6f1fba758da6269836f30fa58/urllib5-5.0.0.tar.gz")
sha256sums=('df396732ad50bc6f7c9b1093cf079a2753578bcea0282b4d594449fef863daa4')

package_python2-urllib5() {
  depends=('python2')
  pkgdesc="Yet another Python urllib. (python2 version)"
  
  cd "${srcdir}/urllib5-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/doc/python2-urllib5"
  install -v -m644 README "${pkgdir}/usr/share/doc/python2-urllib5/"
}

package_python-urllib5() {
  depends=('python')
  pkgdesc="Yet another Python urllib. (python3 version)"

  cd "${srcdir}/urllib5-${pkgver}"  
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/doc/python-urllib5"
  install -v -m644 README "${pkgdir}/usr/share/doc/python-urllib5/"
}
