# Maintainer: j605

_pkgname="perf"
pkgbase="python-$_pkgname"
pkgname=("python-$_pkgname" "python2-$_pkgname")
pkgver=1.4
pkgrel=2
pkgdesc="Python module to generate and modify perf"
arch=('any')
license=('MIT')
url="https://github.com/haypo/perf"
depends=('python' 'python2' 'python-six' 'python2-six' 'python2-statistics'
         'irqbalance')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/de/c1/7f8ef204eec8dd31ad4c1e618a820d8b5dd4a89426b1a2e705901bab79ef/perf-1.4.tar.gz")
md5sums=("fcf55a43d601522e1d5d8603af9af6f0")

package_python2-perf() {
  depends=('python2-six' 'python2-statistics')

  cd $_pkgname-$pkgver
  python2 setup.py install --prefix=/usr --root="${pkgdir}"

  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-perf(){
depends=('python-six')

  cd $_pkgname-$pkgver
  python setup.py install --prefix=/usr --root="${pkgdir}"

  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
