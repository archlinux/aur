# Maintainer: François-Xavier Bru <francoisxavier.bru at orange dot com>
pkgname=dependency-check-cli
_pkgname=dependency-check
pkgver=5.3.2
pkgrel=1
pkgdesc="Dependency-Check is a Software Composition Analysis (SCA) tool that attempts to detect publicly disclosed vulnerabilities contained within a project's dependencies."
arch=('any')
depends=('java-runtime')
url="https://github.com/jeremylong/DependencyCheck"
license=('Apache')
source=("https://bintray.com/jeremy-long/owasp/download_file?file_path=${_pkgname}-${pkgver}-release.zip")
sha256sums=('4c6f40cb596e335fd0cd816bd6c25773e1e029c3109979ce4c429f3b49850252')
install=${pkgname}.install

package() {

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${_pkgname}"

  cp -r "${srcdir}/${_pkgname}/"* "${pkgdir}/opt/${_pkgname}"
  chmod +x ${pkgdir}/opt/${_pkgname}/bin/dependency-check.sh
  ln -s /opt/${_pkgname}/bin/dependency-check.sh "${pkgdir}"/usr/bin/dependency-check
}

