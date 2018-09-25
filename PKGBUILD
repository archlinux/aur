# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgbase=python-identify
pkgname=('python-identify' 'python2-identify')
pkgname=python-identify
pkgver=1.1.6
pkgrel=1
pkgdesc="File identification library for Python."
arch=(any)
url="https://github.com/chriskuehl/identify"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://github.com/chriskuehl/identify/archive/v${pkgver}.tar.gz")
sha256sums=('46df0ea2e747870a605420a68cbec9ec2cdb199af9d00d72d22ca1383215b323')

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
