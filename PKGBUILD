# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Joris Steyn <jorissteyn@gmail.com>
# Please report issues at https://github.com/sanduhrs/arch-aur-php-codesniffer-drupal

_pkgname=php-codesniffer-drupal
pkgname=${_pkgname}
pkgver=8.x_2.7
_pkgver=${pkgver//[_]/-}
pkgrel=1
pkgdesc="Drupal coding standard for PHP_CodeSniffer"
arch=("any")
url="http://drupal.org/project/coder"
license=("GPL")
depends=("php-codesniffer")
makedepends=("git")
source=("${_pkgname}"::"git+https://git.drupal.org/project/coder.git")
sha512sums=('SKIP')

package() {
    install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/Drupal"
    cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}/coder_sniffer/Drupal/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
    install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/DrupalPractice"
    cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}/coder_sniffer/DrupalPractice/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
}
