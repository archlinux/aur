# Maintainer: Josh 'jheretic' King <josh at chambana dot net>

pkgname=drush_make
pkgver=2.3
pkgrel=1
pkgdesc="Drush Makefile extension for building Drupal sites."
arch=('any')
url="http://drupal.org/project/drush_make/"
license=('GPL')
depends=('drush')
source=(http://ftp.drupal.org/files/projects/$pkgname-6.x-$pkgver.tar.gz)

build() {
  cd ${srcdir}/${pkgname}
  mkdir -p ${pkgdir}/usr/share/doc/drush/drush_make/
  mv ./*.txt ${pkgdir}/usr/share/doc/drush/drush_make/ || return 1
  mv EXAMPLE.make ${pkgdir}/usr/share/doc/drush/drush_make/ || return 1
  install -d ${pkgdir}/usr/share/drush/commands/${pkgname}
  cp -rf ${srcdir}/${pkgname}/* ${pkgdir}/usr/share/drush/commands/${pkgname}
}
md5sums=('d6636db943d4f996474b09245060263c')
