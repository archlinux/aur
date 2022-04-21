# Maintainer: robertfoster
# Contributor: François-Xavier Bru <francoisxavier.bru at orange dot com>

pkgname=dependency-check-cli
pkgver=7.0.4
pkgrel=1
pkgdesc="Dependency-Check is a Software Composition Analysis (SCA) tool that attempts to detect publicly disclosed vulnerabilities contained within a project's dependencies."
arch=('any')
depends=('java-runtime')
url="https://github.com/jeremylong/DependencyCheck"
license=('Apache')
source=("https://github.com/jeremylong/DependencyCheck/releases/download/v${pkgver}/${pkgname%%-cli}-${pkgver}-release.zip")
install=${pkgname}.install

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${pkgname%%-cli}"

  cp -r "${srcdir}/${pkgname%%-cli}/"* "${pkgdir}/opt/${pkgname%%-cli}"
  chmod +x ${pkgdir}/opt/${pkgname%%-cli}/bin/dependency-check.sh
  ln -s /opt/${pkgname%%-cli}/bin/dependency-check.sh "${pkgdir}"/usr/bin/dependency-check
}

sha256sums=('18a252ce7d379c060e8f37546ac5d0ebcc0e92a2c9007fae45afd1b3438c8183')
