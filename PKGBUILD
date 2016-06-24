# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

pkgname='python-pympler'
pkgver='0.4.3'
pkgrel=1
pkgdesc='Measure, monitor and analyze the memory behavior of Python objects'
arch=('any')
url='http://pythonhosted.org/Pympler/'
license=('Apache2')
depends=('python')
makedepends=('python2-pip' 'python-pip')
source=('https://pypi.python.org/packages/7c/4d/7da5db3fa5939f661b92d46b3918ae57449a8522507e6562c586a7491d0e/Pympler-0.4.3.tar.gz')
md5sums=('bbb4239126e9c99e2effc83b02bf8755')

package() {
  cd "${srcdir}/Pympler-${pkgver}"
  echo :: Installing for python2.7 ...
  pip2 install --isolated --root="${pkgdir}" --no-deps --ignore-installed .
  echo :: Installing for python3.5 ...
  pip install --isolated --root="${pkgdir}" --no-deps --ignore-installed .
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

