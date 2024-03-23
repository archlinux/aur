# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=stack-bin
_pkgname=stack
pkgver=2.15.3
pkgrel=1
pkgdesc="The Haskell Tool Stack. Packaged from upstream binary release."
arch=('x86_64')
url="https://github.com/commercialhaskell/${_pkgname}"
license=('BSD-3-Clause')
depends=(gmp zlib)
provides=(stack stack-static)
conflicts=(stack stack-static)
source=("https://github.com/commercialhaskell/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-${arch}.tar.gz")
sha256sums=('25ccba5988611e51fed8904acb97f6149df6dd91b72616a8653bc52260820a41')
package() {
  cd ${srcdir}/${_pkgname}-${pkgver}-linux-${arch}
  install -Dm755 stack "${pkgdir}/usr/bin/stack"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 ChangeLog.md "${pkgdir}/usr/share/doc/${_pkgname}/ChangeLog.md"
  install -Dm644 CONTRIBUTING.md "${pkgdir}/usr/share/doc/${_pkgname}/CONTRIBUTING.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
