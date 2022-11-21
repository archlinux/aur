# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python38-requestsexceptions
pkgver=1.4.0
pkgrel=9
pkgdesc="Import exceptions from potentially bundled packages in requests."
arch=('any')
url="https://github.com/openstack-infra/requestsexceptions"
license=('Apache')
depends=('python38-requests')
makedepends=('python38-pbr')
source=("$pkgname-$pkgver.tar.gz::https://github.com/openstack-infra/requestsexceptions/archive/$pkgver.tar.gz")
sha512sums=('fb7cf432584963eee659b7294a11b4d0a1d1dd850bfccdac7a1d7014b6e97a5330553436df58c034088c8a2096b14bfe40ded7e128a5d8741114265c935cd02f')

export PBR_VERSION=$pkgver

build() {
  cd requestsexceptions-$pkgver
  python3.8 setup.py build
}

package() {
  cd requestsexceptions-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
