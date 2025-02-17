# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: grawity

pkgname=kcbench
pkgver=0.9.12
pkgrel=1
pkgdesc="Linux kernel compile benchmark"
arch=(any)
url="https://gitlab.com/knurd42/kcbench"
license=(MIT)
depends=(bc binutils bison curl flex gcc libelf make openssl perl pkg-config time)
source=("https://gitlab.com/knurd42/kcbench/-/archive/v${pkgver}/kcbench-v${pkgver}.tar.gz")
sha256sums=('2aebcb12ff8ee4837aeaa4eda43f3ba0987f376c326ca099cbcbfa69bd38fc00')

package() {
  cd "kcbench-v${pkgver}"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  ln -nsf kcbench "$pkgdir"/usr/bin/kcbenchrate
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
