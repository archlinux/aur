
pkgname='python2-psutil'
pkgver=5.9.1
pkgrel=1
pkgdesc='A cross-platform process and system utilities module for Python2'
arch=('x86_64')
url='https://github.com/giampaolo/psutil'
license=('custom: BSD')
makedepends=('python2' 'python2-setuptools')
source=("https://github.com/giampaolo/psutil/archive/release-$pkgver.tar.gz")
sha512sums=('44008ce813157c09772420c1c5d1f02bc47648286f451e61d3976d36f0c45a7f520bdaaeb59701197ddcb3d7b50b2c83b55190f10667edbf216e44bf08d1eca8')

build() {
  cd psutil-release-$pkgver

  python2 setup.py build
}

package() {
  cd psutil-release-$pkgver

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m 644 LICENSE "$pkgdir/"usr/share/licenses/$pkgname/LICENSE
}
