# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=faustfilters
pkgver=0.4.0
pkgrel=1
pkgdesc='A collection of virtual-analog filter plugins'
arch=(x86_64)
url="https://github.com/SpotlightKid/${pkgname}"
license=(MIT)
depends=(glibc gcc-libs)
groups=(pro-audio clap-plugins ladspa-plugins lv2-plugins vst-plugins vst3-plugins)
source=("https://github.com/SpotlightKid/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-source.tar.gz")
sha256sums=('8dd653ec49a0c47de147236ca469578eb7002156b1633eef981104ad6a6eefd3')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" PREFIX=/usr install
  # install documentation
  install -vDm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname}
  # install license file
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
