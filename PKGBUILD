# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Joris Steyn <jorissteyn@gmail.com>
pkgname=php-codesniffer-drupal
pkgver=8.x_2.3
_pkgver=${pkgver//[_]/-}
pkgrel=1
pkgdesc="Drupal coding standard for PHP_CodeSniffer"
arch=("any")
url="http://drupal.org/project/coder"
license=("GPLv2")
depends=("php-codesniffer")
provides=("php-codesniffer-drupal")
source=("http://ftp.drupal.org/files/projects/coder-${_pkgver}.tar.gz")
sha512sums=('4be7dcfadcc45e23660e5a0c311d29ea9b9ea296b81597d9be25f107734568c00b71d761e5f99213da082014870756135ab9bc4980ea8e2d4803dea0d860851d')

package() {
    install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/Drupal"
    cp -dr --no-preserve=ownership "${srcdir}/coder/coder_sniffer/Drupal/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/Drupal/"
    install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/DrupalPractice"
    cp -dr --no-preserve=ownership "${srcdir}/coder/coder_sniffer/DrupalPractice/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/DrupalPractice/"
}
