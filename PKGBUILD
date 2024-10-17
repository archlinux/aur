# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: grawity

pkgname=kcbench
pkgver=0.9.11
pkgrel=1
pkgdesc="Linux kernel compile benchmark"
arch=(any)
url="https://gitlab.com/knurd42/kcbench"
license=(MIT)
depends=(  bc binutils bison curl flex gcc libelf make openssl perl pkg-config time)
source=("https://gitlab.com/knurd42/kcbench/-/archive/v${pkgver}/kcbench-v${pkgver}.tar.gz")
sha256sums=('e6fac69ba1cb7debff1a805336dfc91a745bda98127ecbad821a8e98869d4233')

package() {
  cd "kcbench-v${pkgver}"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  ln -nsf kcbench "$pkgdir"/usr/bin/kcbenchrate
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
