# Maintainer: TrekDev <trekdev0 at gmail dot com>
pkgname=ethereumjs-testrpc-git
pkgver=2.0.1
pkgrel=1
pkgdesc='Fast Ethereum RPC client for testing and development'
url='https://github.com/ethereumjs/testrpc'
arch=('any')
license=('MIT')
source=("testrpc::git+https://github.com/ethereumjs/testrpc.git")
makedepends=('npm')
depends=('nodejs')
sha256sums=('SKIP')
provides=('testrpc')

package() {
  cd "${srcdir}/testrpc"
  rm -Rf .git*
  npm install

  mkdir -p "${pkgdir}/usr/lib/"
  cp -R "${srcdir}/testrpc" "${pkgdir}/usr/lib/"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/lib/testrpc/bin/testrpc" "${pkgdir}/usr/bin/testrpc"

  install -D -m644 "${srcdir}/testrpc/LICENSE" "${pkgdir}/usr/share/licenses/testrpc/LICENSE"
}
