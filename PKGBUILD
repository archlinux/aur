# Maintainer: François-Xavier Bru <francoisxavier/dot/bru/at/orange/dot/com>
pkgname=devskim-cli-bin
_pkgname=devskim
pkgver=0.4.134
pkgrel=1
pkgdesc="Microsoft DevSkim is a set of IDE plugins and rules that provide security \"linting\" capabilities (official CLI binary version)"
arch=('x86_64')
url="https://github.com/Microsoft/DevSkim/"
license=('MIT')
provides=('devskim-cli')
depends=(dotnet-runtime)
options=(staticlibs)
source=(https://github.com/microsoft/DevSkim/releases/download/v${pkgver}/DevSkim_linux_${pkgver}.zip)
sha256sums=('C5916C6512D696386A6C0847C2F18FC579C3CA98056B521F00C029EB0A6E7330')

package() {
  _pkg=DevSkim_${pkgver}

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${_pkgname}"

  cp -r "${srcdir}/${_pkg}/"* "${pkgdir}/opt/${_pkgname}"
  chmod +x ${pkgdir}/opt/${_pkgname}/devskim
  ln -s /opt/${_pkgname}/devskim "${pkgdir}"/usr/bin/devskim
}

