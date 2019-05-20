# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgbase=python-identify
pkgname=('python-identify' 'python2-identify')
pkgname=python-identify
pkgver=1.4.3
pkgrel=1
pkgdesc="File identification library for Python."
arch=(any)
url="https://github.com/chriskuehl/identify"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://github.com/chriskuehl/identify/archive/v${pkgver}.tar.gz")
sha256sums=('44cb90e9e59a9c27db63136d659efb9d85c39408bd8e00c0fb2f77ed98b05d25')

package_python2-identify() {
  depends=('python2')
  pkgdesc="File identification library for Python. (python2 version)"
  
  cd "${srcdir}/identify-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  mv "${pkgdir}/usr/bin/identify-cli" "${pkgdir}/usr/bin/identify-cli2"
  install -v -m755 -d "${pkgdir}/usr/share/doc/python2-identify"
  install -v -m644 README.md "${pkgdir}/usr/share/doc/python2-identify/"
}

package_python-identify() {
  depends=('python')
  pkgdesc="File identification library for Python. (python3 version)"

  cd "${srcdir}/identify-${pkgver}"  
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/doc/python-identify"
  install -v -m644 README.md "${pkgdir}/usr/share/doc/python-identify/"
}
