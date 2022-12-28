# Maintainer: robertfoster
# Contributor: François-Xavier Bru <francoisxavier.bru at orange dot com>

pkgname=dependency-check-cli
pkgver=7.4.2
pkgrel=1
pkgdesc="Dependency-Check is a Software Composition Analysis (SCA) tool that attempts to detect publicly disclosed vulnerabilities contained within a project's dependencies."
arch=('any')
depends=('java-runtime')
url="https://github.com/jeremylong/DependencyCheck"
license=('Apache')
source=("${url}/releases/download/v${pkgver}/${pkgname%%-cli}-${pkgver}-release.zip")
install=${pkgname}.install

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${pkgname%%-cli}"

  cp -r "${srcdir}/${pkgname%%-cli}/"* "${pkgdir}/opt/${pkgname%%-cli}"
  chmod +x ${pkgdir}/opt/${pkgname%%-cli}/bin/dependency-check.sh
  ln -s /opt/${pkgname%%-cli}/bin/dependency-check.sh "${pkgdir}"/usr/bin/dependency-check
}

sha256sums=('7e282b5541703da3689f3cecc8c4b5a91a20b85e2be312b3129746d6e9abb907')
