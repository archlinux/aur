# Maintainer: j605

_name=iWant
pkgname=iwant
pkgver=1.0.14
pkgrel=1
pkgdesc="CLI based decentralized peer to peer file sharing"
arch=('any')
url="https://github.com/nirvik/iWant"
license=('MIT')
depends=('python2-twisted' 'python2-netifaces' 'python2-watchdog'
         'python2-time_uuid' 'python2-fuzzywuzzy' 'python2-tabulate'
         'python2-service-identity' 'python2-cryptography'
         'python2-levenshtein' 'python2-progressbar' 'python2-pyasn1'
         'python2-docopt')
source=("https://pypi.python.org/packages/0d/82/a8a6efa0a11dd5a2e0b7f427f59253af9f1c00dad61f86e2c93f9ae2aec8/$pkgname-$pkgver.tar.gz")
md5sums=("6dcb4219cc5976c7c62b4bb058d7490a")

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  python2 setup.py build --executable=/usr/bin/python2
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --prefix=/usr --optimize=2

  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
