# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Joris Steyn <jorissteyn@gmail.com>

pkgname=php-codesniffer-drupal
pkgver=8.x_2.5
_pkgver=${pkgver//[_]/-}
pkgrel=1
pkgdesc="Drupal coding standard for PHP_CodeSniffer"
arch=("any")
url="http://drupal.org/project/coder"
license=("GPL")
depends=("php-codesniffer")
makedepends=("git")
source=("${pkgname}"::"git+https://git.drupal.org/project/coder.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/Drupal"
    cp -dr --no-preserve=ownership "${srcdir}/${pkgname}/coder_sniffer/Drupal/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
    install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/DrupalPractice"
    cp -dr --no-preserve=ownership "${srcdir}/${pkgname}/coder_sniffer/DrupalPractice/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
}
