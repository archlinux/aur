pkgname='exabgp'
pkgver=3.4.20
pkgrel=1
pkgdesc="The BGP swiss army knife of networking"
url="https://github.com/Exa-Networks/exabgp"
license=('GPL3')
makedepends=('python2-distribute')
depends=('python2')
arch=('any')
source=("https://github.com/Exa-Networks/exabgp/archive/${pkgver}.tar.gz")

package() {
  cd "$srcdir/exabgp-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -m 755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m 644 etc/systemd/exabgp.service "${pkgdir}/usr/lib/systemd/system/exabgp.service"
}
md5sums=('ccc16c86fbd0a91b3e568605e79e6068')
sha1sums=('13ff0c43414d3a9077cc5ba3bdf10a438488671b')
sha256sums=('54e6b5ebbc316b3199e3ef2c735731f94d8781494151df126684a3279ac4f83f')
