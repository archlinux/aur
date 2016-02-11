# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>

pkgbase=python-requests-cache
_pyname=requests-cache
pkgname=('python-requests-cache' 'python2-requests-cache')
makedepends=('python' 'python2')
pkgver=0.4.10
pkgrel=1
pkgdesc="Persistent cache for requests library"
arch=('any')
url="https://github.com/reclosedev/requests-cache"
license=('BSD')
source=("https://github.com/reclosedev/$_pyname/archive/v$pkgver.tar.gz")
sha512sums=('677923baf822a518958ff499197c668d43e15c300a4a86bf84d4a2bb9ddd97bfdd97ac0f9d064900fb5119a8fe43b129b6a29eaaba131beb5b031578799b94cc')

package_python-requests-cache() {
  depends=('python')
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py install -O1 --root=$pkgdir
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"

}

package_python2-requests-cache() {
  depends=('python2')
  cd "$srcdir/$_pyname-$pkgver"
  python2 setup.py install -O1 --root=$pkgdir
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"

}

# vim:set et sw=2 ts=2 tw=79:
