# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgbase=python-backoff
pkgname=('python-backoff' 'python2-backoff')
_name=${pkgname#python-}
pkgver=1.8.0
pkgrel=1
pkgdesc="Function decoration for backoff and retry."
arch=('any')
url="https://github.com/litl/backoff"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('697c87f0ba52528e4e8acaa6dc6d4d6d26681c7fc59246e7731b9cc3a702f803edba605795f3a4d401d820642917b4b6356a48432804b29d99e94e68adad84dd')

prepare() {
  cp -a backoff-$pkgver{,-py2}
}

package_python-backoff() {
  cd backoff-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-backoff() {
  cd backoff-${pkgver}-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
