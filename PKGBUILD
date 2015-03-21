# Maintainer: Felix Yan <felixonmars@archlinux.org>

_pypiname=mimerender
pkgbase=python-$_pypiname
pkgname=(python-$_pypiname python2-$_pypiname)
pkgver=0.5.5
pkgrel=1
pkgdesc="Transparently select a render function for an HTTP request handler's result"
arch=('any')
url="https://github.com/martinblech/mimerender"
license=('MIT')
makedepends=('python-mimeparse' 'python2-mimeparse' 'python-setuptools' 'python2-setuptools')
source=("$_pypiname-$pkgver.tar.gz::https://github.com/martinblech/$_pypiname/archive/v$pkgver.tar.gz")
sha512sums=('e0788a6844bf189712b9107dd8f411af5e6b710e9d1e35d65d0ae43a058e4f81d3b6842ead70ba644080350788c493e01c38e139d0f505c52581e50cfe3ed789')

prepare() {
  cp -a $_pypiname-$pkgver{,-py2}
}

package_python-mimerender() {
  depends=('python-mimeparse')

  cd $_pypiname-$pkgver
  python setup.py install -O1 --root "$pkgdir"
}

package_python2-mimerender() {
  depends=('python2-mimeparse')

  cd $_pypiname-$pkgver-py2
  python2 setup.py install -O1 --root "$pkgdir"
}
