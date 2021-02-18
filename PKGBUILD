# Maintainer: François-Xavier Bru <francoisxavier.bru at orange dot com>
pkgname=dependency-check-cli
_pkgname=dependency-check
pkgver=6.1.1
pkgrel=1
pkgdesc="Dependency-Check is a Software Composition Analysis (SCA) tool that attempts to detect publicly disclosed vulnerabilities contained within a project's dependencies."
arch=('any')
depends=('java-runtime')
url="https://github.com/jeremylong/DependencyCheck"
license=('Apache')
source=("https://github.com/jeremylong/DependencyCheck/releases/download/v${pkgver}/${_pkgname}-${pkgver}-release.zip")
sha256sums=('800d2909b4c4323a1a68d86847b21521f38020fdce330e009affe43297285e40')
install=${pkgname}.install

package() {

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${_pkgname}"

  cp -r "${srcdir}/${_pkgname}/"* "${pkgdir}/opt/${_pkgname}"
  chmod +x ${pkgdir}/opt/${_pkgname}/bin/dependency-check.sh
  ln -s /opt/${_pkgname}/bin/dependency-check.sh "${pkgdir}"/usr/bin/dependency-check
}

