# Maintainer: Hugo Osvaldo Barrera <hugo@whynothugo.nl>

pkgname=lsplug
pkgver=1
pkgrel=1
pkgdesc="Generator-based operators for asynchronous iteration"
arch=('any')
url=https://github.com/vxgmichel/aiostream
license=('GPLv3')
depends=('python' 'hwdata')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('76dc0e25ee52d3a5f0b822906848817c501574c75e57fcc5277d130ff8494894b8f9d82fc9e7a60f305f4bd77bd8005301320d00817e6be0c9dc4a59c7410a87')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
