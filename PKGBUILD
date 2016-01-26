# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=zcash-git
pkgver=zc.v0.11.2.z0.15.g405dd80
pkgrel=1
pkgdesc="Decentralized and open source cryptocurrency"
arch=('any')
url="https://z.cash"
license=(MIT)
makedepends=('wget' 'unzip')
provides=('zcash')
source=("git+https://github.com/Electric-Coin-Company/zcash")
sha1sums=('SKIP')
install="${pkgname}.install"
_gitname=zcash

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd $_gitname
  ./zcutil/build.sh
}

package() {
  cd $_gitname
  install -Dm755 src/zcash-cli "${pkgdir}/usr/bin/zcash-cli"
  install -Dm755 src/zcashd "${pkgdir}/usr/bin/zcashd"
}

# vim:set ts=2 sw=2 et:
