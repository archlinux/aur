# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Joris Steyn <jorissteyn@gmail.com>
pkgname=php-codesniffer-drupal
pkgver=8.x_2.4
_pkgver=${pkgver//[_]/-}
pkgrel=1
pkgdesc="Drupal coding standard for PHP_CodeSniffer"
arch=("any")
url="http://drupal.org/project/coder"
license=("GPLv2")
depends=("php-codesniffer")
provides=("php-codesniffer-drupal")
source=("http://ftp.drupal.org/files/projects/coder-${_pkgver}.tar.gz")
sha512sums=('93bcbffa96949784c5f0f173681dcd0e177dc2adca41fa063c6e41ab19e28362f6a103835872bb58e10e6d054d9085043bde903a0cc30e9c3cd12bce70b46fd3')

package() {
    install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/Drupal"
    cp -dr --no-preserve=ownership "${srcdir}/coder/coder_sniffer/Drupal/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/Drupal/"
    install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/DrupalPractice"
    cp -dr --no-preserve=ownership "${srcdir}/coder/coder_sniffer/DrupalPractice/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/DrupalPractice/"
}
