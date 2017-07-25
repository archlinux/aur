# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='lxc-snapshots'
pkgver=1.09
pkgrel=1
pkgdesc='Run pi-hole or openvpn in lxc snapshot containers via systemd'
arch=('any')
url='https://github.com/graysky2/lxc-snapshots'
license=('MIT')
depends=('systemd' 'lxc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
backup=('etc/conf.d/openvpn-lxc-snapshot.conf' 'etc/conf.d/pihole-lxc-snapshot.conf')
sha256sums=('0352421147b24ff5d68d4684a729bf1d7c6bb25fd53964c32410458f07287c6d')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
