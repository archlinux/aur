# Maintainer: Nikola Milinković <nikmil@gmail.com>
# Submitter: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgbase=python-regex
pkgname=('python-regex' 'python2-regex')
pkgname=python-regex
pkgver=2016.04.15
pkgrel=1
epoch=1
pkgdesc="Alternative python regular expression module."
arch=(any)
url="https://bitbucket.org/mrabarnett/mrab-regex"
license=('Python')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/r/regex/regex-${pkgver}.tar.gz")
md5sums=('aea95174223a631da88d2956c0fadfbd')

package_python2-regex() {
  depends=('python2')
  conflicts=('python2-regex-hg')
  pkgdesc="Alternative python regular expression module. (python2 version)"
  
  cd "${srcdir}/regex-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/doc/python2-regex"
  install -v -m644 ./docs/Features.html "${pkgdir}/usr/share/doc/python2-regex/"
  install -v -m644 ./docs/Features.rst "${pkgdir}/usr/share/doc/python2-regex/"
  install -v -m644 ./docs/UnicodeProperties.txt "${pkgdir}/usr/share/doc/python2-regex/"
}

package_python-regex() {
  depends=('python')
  conflicts=('python-regex-hg')
  pkgdesc="Alternative python regular expression module. (python3 version)"

  cd "${srcdir}/regex-${pkgver}"  
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/doc/python-regex"
  install -v -m644 ./docs/Features.html "${pkgdir}/usr/share/doc/python-regex/"
  install -v -m644 ./docs/Features.rst "${pkgdir}/usr/share/doc/python-regex/"
  install -v -m644 ./docs/UnicodeProperties.txt "${pkgdir}/usr/share/doc/python-regex/"
}
