pkgname=python-ifcfg
pkgver=0.22
pkgrel=1
pkgdesc=" Python cross-platform network interface discovery (ifconfig/ipconfig/ip)"
depends=('python')
makedepends=('python-setuptools')
arch=('x86_64')
url="https://github.com/ftao/python-ifcfg"
license=('BSD')
source=("https://github.com/ftao/python-ifcfg/archive/refs/tags/releases/$pkgver.tar.gz")
sha256sums=('84e81b2e6cab210b2b64bc7cc02d6e26d5e064078866dd95cf15415cc5ffeca4')

build() {
  cd "${srcdir}/${pkgname}-releases-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-releases-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
