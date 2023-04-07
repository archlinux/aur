
pkgname='python2-psutil'
pkgver=5.9.4
pkgrel=1
pkgdesc='A cross-platform process and system utilities module for Python2'
arch=('x86_64')
url='https://github.com/giampaolo/psutil'
license=('custom: BSD')
makedepends=('python2' 'python2-setuptools')
source=("https://github.com/giampaolo/psutil/archive/release-$pkgver.tar.gz")
sha512sums=('ea131f301e1464bde52493910631d3cb3c8ac6a8456c19218c24433d94c11eada1cb553496838ba42eff0d6ea2ed8be68115261439fdf6ea4a642fa3fc18dc1c')

build() {
  cd psutil-release-$pkgver

  python2 setup.py build
}

package() {
  cd psutil-release-$pkgver

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m 644 LICENSE "$pkgdir/"usr/share/licenses/$pkgname/LICENSE
}
