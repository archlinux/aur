# Maintainer: James An <james@jamesan.ca>

pkgname=drush-scaffolding
_pkgname=${pkgname#drush-}
pkgver=7.x_1.0
pkgrel=1
pkgdesc="A Drush command to fetch assorted site building and development modules to enable and configure."
arch=('any')
url="https://www.drupal.org/project/$_pkgname"
license=('GPL')
depends=('drush')
makedepends=('drupal')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=()
install=
source=("https://ftp.drupal.org/files/projects/$_pkgname-${pkgver//_/-}.tar.gz")
md5sums=('f637f7b917888beed096914f98497aef')

package() {
  cd "$_pkgname"

  install -Dm755 scaffold.drush.inc "$pkgdir/usr/share/webapps/drush/commands/$_pkgname/scaffold.drush.inc"
}
