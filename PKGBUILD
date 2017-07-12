# Maintainer: j605

_pkgname="time_uuid"
pkgbase="python-$_pkgname"
pkgname=("python-$_pkgname" "python2-$_pkgname")
pkgver=0.2.0
pkgrel=1
pkgdesc="A sensible class for dealing with UUIDv1"
arch=('any')
license=('BSD')
url="https://github.com/samuraisam/$_pkgname"
makedepends=('python' 'python2')
source=("https://pypi.python.org/packages/eb/2c/033a19c31c5ca828104cd8666623904b9f64c1ff0858fa7ac6789130df3e/${_pkgname/_/-}-$pkgver.tar.gz"
        "license.txt")
md5sums=("1483a8d84e5938f3efed1d71d91e27f3"
         "5c2857983bc7c937295d85e97aa776bb")

package_python2-time_uuid() {
  depends=('python2')

  cd ${_pkgname/_/-}-$pkgver
  python2 setup.py install --prefix=/usr --root="${pkgdir}"

  install -Dm 644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-time_uuid() {
  depends=('python')

  cd ${_pkgname/_/-}-$pkgver
  python setup.py install --prefix=/usr --root="${pkgdir}"

  install -Dm 644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
