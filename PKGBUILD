# Maintainer: Benjamin Gallois <benjamin.gallois at fasttrack dot sh>
pkgbase=fasttrack
pkgname=(fasttrack fasttrack-cli)
pkgver=5.3.5
pkgrel=3
pkgdesc='Multiple objects tracking software, easy to use, and performant.'
arch=(any)
url='https://www.fasttrack.sh'
license=(GPL3)
groups=()
depends=('opencv>=4.0.0' qt5-base qt5-webengine gcc-libs)
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/FastTrackOrg/FastTrack/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('0027fceb2bb21e6ddfed89904188f89660cfa76a4da7b747326a2824070b2a3a')

prepare() {
  mv "FastTrack-$pkgver" "$pkgbase-$pkgver"
}

build() {
  cd "$pkgbase-$pkgver"
  ./run.sh ci
  ./run.sh cli
}

package_fasttrack() {
  cd "$pkgbase-$pkgver"
  install -D build/fasttrack -t "$pkgdir"/usr/bin/
  install -D sh.fasttrack.fasttrack.desktop -t "$pkgdir"/usr/share/applications/
  install -D sh.fasttrack.fasttrack.metainfo.xml -t "$pkgdir"/usr/share/metainfo/
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -D src/assets/fasttrack.png -t "$pkgdir"/usr/share/icons/$pkgname/
}

package_fasttrack-cli() {
  cd "$pkgbase-$pkgver"
  install -D build_cli/fasttrack-cli "$pkgdir"/usr/bin/fasttrack-cli
}
sha256sums=('a2f00e5fa9c32ab1947b7e7390a0e1550e6d316dedfc816d90c0fa456960bc71')
sha256sums=('a2f00e5fa9c32ab1947b7e7390a0e1550e6d316dedfc816d90c0fa456960bc71')
sha256sums=('a2f00e5fa9c32ab1947b7e7390a0e1550e6d316dedfc816d90c0fa456960bc71')
