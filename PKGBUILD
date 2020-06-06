#Maintainer: Harley Wiltzer <harleyw@hotmail.com>

pkgname='python-omegaconf'
pkgver='2.0.0'
pkgrel=1
epoch=
pkgdesc='Flexible Python configuration system. The last one you will ever need.'
arch=('any')
url='https://github.com/omry/omegaconf'
license=('custom')
depends=('python>=3.6'
         'python-pyaml>=5.1'
         'python-typing_extensions'
         'python-pip'
         'python-wheel')
checkdepends=('python-pytest' 'python-pytest-mock')
provides=("$pkgname=$pkgver")
source=("$pkgname-$pkgver::https://github.com/omry/omegaconf/archive/$pkgver.tar.gz")
md5sums=('2d3db08dff23b499dbe7fde4e402a9ed')

check() {
  cd "omegaconf-$pkgver"
  python setup.py test
}

package() {
  cd "omegaconf-$pkgver"
  python setup.py install --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
