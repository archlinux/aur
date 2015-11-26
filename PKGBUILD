# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Joris Steyn <jorissteyn@gmail.com>
pkgname=php-codesniffer-drupal
pkgver=8.x_2.5
_pkgver=${pkgver//[_]/-}
pkgrel=2
pkgdesc="Drupal coding standard for PHP_CodeSniffer"
arch=("any")
url="http://drupal.org/project/coder"
license=("GPLv2")
depends=("php-codesniffer")
provides=("php-codesniffer-drupal")
source=("http://ftp.drupal.org/files/projects/coder-${_pkgver}.tar.gz")
sha512sums=('90d3174b5cc96bf1ff8325e507bef542e8cc560411b941c7bce0da9bd81f4bde26e8969a199c08f4afbdc9ef6f2558040bbae5e44dda0ca3f2b164bdf49aa169')

package() {
    install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/Drupal"
    cp -dr --no-preserve=ownership "${srcdir}/coder/coder_sniffer/Drupal/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
    install -d "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/DrupalPractice"
    cp -dr --no-preserve=ownership "${srcdir}/coder/coder_sniffer/DrupalPractice/" "${pkgdir}/usr/share/pear/PHP/CodeSniffer/Standards/"
}
