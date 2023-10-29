pkgname=python-ifcfg
pkgver=0.24
pkgrel=1
pkgdesc=" Python cross-platform network interface discovery (ifconfig/ipconfig/ip)"
depends=('python')
makedepends=('python-setuptools')
arch=('x86_64')
url="https://github.com/ftao/python-ifcfg"
license=('BSD')
source=("https://github.com/ftao/python-ifcfg/archive/refs/tags/releases/$pkgver.tar.gz")
sha256sums=('9b3baef6f21ace5741e3bedfc9208825dfd54480fa661148e0aeda1cfa16a6f5')

build() {
  cd "${srcdir}/${pkgname}-releases-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-releases-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
