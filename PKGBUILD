# Maintainer: Nikola Milinković <nikmil@gmail.com>
# Submitter: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgbase=python-regex
pkgname=('python-regex' 'python2-regex')
pkgname=python-regex
pkgver=2016.07.21
pkgrel=1
epoch=1
pkgdesc="Alternative python regular expression module."
arch=(any)
url="https://bitbucket.org/mrabarnett/mrab-regex"
license=('Python')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/78/d6/b6b588052370fa02d6dc95c6e081a7566b9a5736056d8c80f2196dabdea9/regex-2016.07.21.tar.gz")
md5sums=('8f2b0b4097eda5d3d8831602b41016c4')

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
