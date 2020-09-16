# Maintainer: François-Xavier Bru <francoisxavier.bru at orange dot com>
pkgname=dependency-check-cli
_pkgname=dependency-check
pkgver=6.0.1
pkgrel=1
pkgdesc="Dependency-Check is a Software Composition Analysis (SCA) tool that attempts to detect publicly disclosed vulnerabilities contained within a project's dependencies."
arch=('any')
depends=('java-runtime')
url="https://github.com/jeremylong/DependencyCheck"
license=('Apache')
source=("https://bintray.com/jeremy-long/owasp/download_file?file_path=${_pkgname}-${pkgver}-release.zip")
sha256sums=('42245c5e235015aa3296206a10d54e2495f4138fa2ff50e58272e0f0c7ffd83a')
install=${pkgname}.install

package() {

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${_pkgname}"

  cp -r "${srcdir}/${_pkgname}/"* "${pkgdir}/opt/${_pkgname}"
  chmod +x ${pkgdir}/opt/${_pkgname}/bin/dependency-check.sh
  ln -s /opt/${_pkgname}/bin/dependency-check.sh "${pkgdir}"/usr/bin/dependency-check
}

