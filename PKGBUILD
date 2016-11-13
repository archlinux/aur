# Maintainer: Troy Engel <troyengel+arch@gmail.com>
# Contributor: ugjka <ugis.germanis@gmail.com>
# Contributor: Bill Sun <billksun@gmail.com>
# Contributor: magnific0

pkgname=wondershaper-git
pkgver=20130306
pkgrel=2
pkgdesc="Limit the bandwidth of one or more network adapters"
arch=('any')
url="https://github.com/magnific0/wondershaper"
license=('GPL2')
depends=('iproute')
makedepends=('git')
backup=('etc/conf.d/wondershaper.conf')
source=("$pkgname"::'git://github.com/magnific0/wondershaper.git')
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 wondershaper "$pkgdir/usr/bin/wondershaper"
  install -Dm644 wondershaper.service \
    "${pkgdir}/usr/lib/systemd/system/wondershaper.service"
  install -Dm644 wondershaper.conf \
    "${pkgdir}/etc/conf.d/wondershaper.conf"
}

# vim:set ts=2 sw=2 et:
