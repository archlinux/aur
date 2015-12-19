pkgname='exabgp'
pkgver=3.4.13
pkgrel=2
pkgdesc="The BGP swiss army knife of networking"
url="https://github.com/Exa-Networks/exabgp"
license=('GPL3')
makedepends=('python-distribute')
depends=('python')
arch=('any')
source=("https://github.com/Exa-Networks/exabgp/archive/${pkgver}.tar.gz")

package() {
  cd "$srcdir/exabgp-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  mv "${pkgdir}/usr/etc" "${pkgdir}/etc"

  install -m 755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m 644 etc/systemd/exabgp.service "${pkgdir}/usr/lib/systemd/system/exabgp.service"
}
md5sums=('af4ae996896251de736c10c54584eaa1')
sha1sums=('3725e38058c140455e7388e8852cdd6abe8393a9')
sha256sums=('e92cf3ff9ac72d1be84f7168f4981bd95973f90ebece86958f3357b24e6c0da3')
