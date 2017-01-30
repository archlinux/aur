# Maintainer: Nikola Milinković <nikmil@gmail.com>
# Submitter: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgbase=python-regex
pkgname=('python-regex' 'python2-regex')
pkgname=python-regex
pkgver=2017.01.17
pkgrel=1
pkgdesc="Alternative python regular expression module."
arch=(any)
url="https://bitbucket.org/mrabarnett/mrab-regex"
license=('Python')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/bd/e6/c2ce19ae370d1b4a597762606ef607e14cdca866699e2622ceb29cac90fe/regex-2017.01.17.tar.gz")
sha256sums=('bc4308766b2473802842cd13b78dae4ccfb49b0cba6aa39f958ecfad4216d9a2')

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
