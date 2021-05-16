# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=solana-bin
pkgver=1.6.9
pkgrel=1
pkgdesc='Binaries for the Solana blockchain'
arch=('x86_64')
url='https://github.com/solana-labs/solana'
license=('Apache')
provides=('solana')
conflicts=('solana')
options=(!strip)
depends=('openssl' 'systemd-libs')

source=("https://github.com/solana-labs/solana/releases/download/v${pkgver}/solana-release-x86_64-unknown-linux-gnu.tar.bz2")
md5sums=('ee0b6e866b40ac950b09cac68e698257')

package() {
  cd ${srcdir}
  mkdir -p "${pkgdir}/usr/bin"
  cp -a solana-release/bin/{spl-token,solana*} "${pkgdir}/usr/bin"
}
