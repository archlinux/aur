pkgname=android2po
pkgver=1.2.0
pkgrel=1
pkgdesc="Convert Android string resources to gettext, and back."
arch=('any')
url="https://github.com/miracle2k/$pkgname"
license=('BSD')
source=("$url/archive/$pkgver.tar.gz"
        require.patch)
md5sums=('962c2478d6f8268788b55ff3eefbd52b'
         '031c84dca250727518ba91b049bbe3e5')
depends=('python2' 'python2-babel' 'python2-lxml')
makedepends=('python2-setuptools')

build() {
  cd "$pkgname-$pkgver"
  patch -Np1 < ../require.patch
  python2 setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python2 ./setup.py install --prefix=/usr --root="$pkgdir"
}
