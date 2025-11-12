# Maintainer: robertfoster
# Contributor: François-Xavier Bru <francoisxavier.bru at orange dot com>

pkgname=dependency-check-cli
pkgver=12.1.9 # renovate: datasource=github-tags depName=dependency-check/DependencyCheck
pkgrel=1
pkgdesc="Dependency-Check is a Software Composition Analysis (SCA) tool that attempts to detect publicly disclosed vulnerabilities contained within a project's dependencies."
arch=('any')
depends=('java-runtime')
url="https://github.com/dependency-check/DependencyCheck"
license=('Apache')
source=("${url}/releases/download/v${pkgver}/${pkgname%%-cli}-${pkgver}-release.zip")
install=${pkgname}.install

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${pkgname%%-cli}"

  cp -r "${srcdir}/${pkgname%%-cli}/"* \
    "${pkgdir}/opt/${pkgname%%-cli}"
  chmod +x ${pkgdir}/opt/${pkgname%%-cli}/bin/dependency-check.sh
  ln -s /opt/${pkgname%%-cli}/bin/dependency-check.sh \
    "${pkgdir}"/usr/bin/dependency-check
}

sha256sums=('ea7ae841ae9005d5d6e957994dec996fd9787279ead355c582a226c67ff6aa37')
