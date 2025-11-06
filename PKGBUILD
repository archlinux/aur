# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>
# Contributor: Jarek Sedlacek <jareksedlacek@gmail.com>

pkgname=pymetar
pkgver=1.4
pkgrel=1
pkgdesc="Downloads the weather report for a given station ID and decodes it"
arch=('any')
url="https://www.schwarzvogel.de/software/pymetar/"
license=('GPL-2.0-only')
depends=('python')
makedepends=('python-setuptools')
source=("https://www.schwarzvogel.de/pkgs/$pkgname-$pkgver.tar.gz")
md5sums=('773d105c1c15cc0a09c7baaaba3d367d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build 
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
