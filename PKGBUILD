# Maintainer: TrekDev <trekdev0 at gmail dot com>
pkgname=truffle-git
pkgbase=truffle
pkgver=1.0.0
pkgrel=1
pkgdesc='A development framework for Ethereum'
url='https://github.com/ConsenSys/truffle'
arch=('any')
license=('MIT')
source=("${pkgbase}::git+https://github.com/ConsenSys/truffle.git")
makedepends=('npm')
depends=('nodejs')
conflicts=('truffle')
sha256sums=('SKIP')
provides=('truffle')

package() {
  cd "${srcdir}/${pkgbase}"
  npm install

  mkdir -p "${pkgdir}/usr/lib/"
  cp -R "${srcdir}/${pkgbase}" "${pkgdir}/usr/lib/"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "${pkgdir}/usr/lib/${pkgbase}/cli.js" "${pkgdir}/usr/bin/${pkgbase}"

  install -D -m644 "${srcdir}/${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}
