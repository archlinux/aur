# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=solana-bin
pkgver=1.5.15
pkgrel=1
pkgdesc='Binaries for the Solana blockchain'
arch=('x86_64')
url='https://github.com/solana-labs/solana'
license=('GPL3')
provides=('solana')
conflicts=('solana')
options=(!strip)
depends=('openssl' 'systemd-libs')

source=("https://github.com/solana-labs/solana/releases/download/v${pkgver}/solana-release-x86_64-unknown-linux-gnu.tar.bz2")
md5sums=('46b58ce4a01bf348ba661d9889f2c513')

package() {
  cd ${srcdir}
  mkdir -p "${pkgdir}/usr/bin"
  cp -a solana-release/bin/{spl-token,solana*} "${pkgdir}/usr/bin"
}
