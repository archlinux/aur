# Maintainer: François-Xavier Bru <francoisxavier.bru at orange dot com>
pkgname=dependency-check-cli
_pkgname=dependency-check
pkgver=6.1.5
pkgrel=1
pkgdesc="Dependency-Check is a Software Composition Analysis (SCA) tool that attempts to detect publicly disclosed vulnerabilities contained within a project's dependencies."
arch=('any')
depends=('java-runtime')
url="https://github.com/jeremylong/DependencyCheck"
license=('Apache')
source=("https://github.com/jeremylong/DependencyCheck/releases/download/v${pkgver}/${_pkgname}-${pkgver}-release.zip")
sha256sums=('54af1e44491cb283cc31d58340110a2c4b98d9362394dee769a1be3c7749e107')
install=${pkgname}.install

package() {

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${_pkgname}"

  cp -r "${srcdir}/${_pkgname}/"* "${pkgdir}/opt/${_pkgname}"
  chmod +x ${pkgdir}/opt/${_pkgname}/bin/dependency-check.sh
  ln -s /opt/${_pkgname}/bin/dependency-check.sh "${pkgdir}"/usr/bin/dependency-check
}

