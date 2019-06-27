pkgname='exabgp'
pkgver=4.1.0
pkgrel=1
pkgdesc="The BGP swiss army knife of networking"
url="https://github.com/Exa-Networks/exabgp"
license=('GPL3')
depends=('python')
arch=('any')
source=("exabgp-${exabgp}::https://github.com/Exa-Networks/exabgp/archive/${pkgver}.tar.gz")

package() {
  cd "$srcdir/exabgp-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -m 755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m 644 etc/systemd/exabgp.service "${pkgdir}/usr/lib/systemd/system/exabgp.service"
}
md5sums=('308d1b93d71b0edf0e547178c5532ed0')
sha1sums=('a7dc4243bdf1d5e98f64aac3afeffc4394f5c488')
sha256sums=('74e7e6d11df6bc3ff3e3b4371ef267036bfa66a8c2a385d126aaef66ed206a1f')
