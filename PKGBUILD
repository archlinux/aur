
pkgname='python2-psutil'
pkgver=5.9.8
pkgrel=1
pkgdesc='A cross-platform process and system utilities module for Python2'
arch=('x86_64')
url='https://github.com/giampaolo/psutil'
license=('custom: BSD')
makedepends=('python2' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/90/c7/6dc0a455d111f68ee43f27793971cf03fe29b6ef972042549db29eec39a2/psutil-$pkgver.tar.gz")
sha512sums=('6ddeed937119a930bb7b9556ff329f054e9429b8457c9a15d99cb105271297117abba587a974d02760bb8b6b244734973a676bdff6b533a53ce587858e48f337')

build() {
  cd "psutil-$pkgver"

  python2 setup.py build
}

package() {
  cd "psutil-$pkgver"

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m 644 LICENSE "$pkgdir/"usr/share/licenses/$pkgname/LICENSE
}
