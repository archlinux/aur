
pkgname='python2-psutil'
pkgver=5.9.0
pkgrel=1
pkgdesc='A cross-platform process and system utilities module for Python2'
arch=('x86_64')
url='https://github.com/giampaolo/psutil'
license=('custom: BSD')
makedepends=('python2' 'python2-setuptools')
source=("https://github.com/giampaolo/psutil/archive/release-$pkgver.tar.gz")
sha512sums=('8f105b84773c901a7969937bac2289281dc48f160f20e2d3d5f9b11f4a108fddf9864b477884c00ec33c3809f9f514a5f5faea623b7445dd8e637b96105a865b')

build() {
  cd psutil-release-$pkgver

  python2 setup.py build
}

package() {
  cd psutil-release-$pkgver

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m 644 LICENSE "$pkgdir/"usr/share/licenses/$pkgname/LICENSE
}
