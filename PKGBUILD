# Mantainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=owncloud-app-contacts-git
epoch=1
pkgver=v0.4.0.0.r78.g484fce0
pkgrel=1
pkgdesc="Contacts app for owncloud"
arch=('any')
url="https://github.com/owncloud/contacts"
license=('GPL')
depends=('owncloud')
makedepends=()
options=('!strip')
conflicts=('owncloud-app-contacts')
provides=('owncloud-app-contacts')
source=("git+https://github.com/owncloud/contacts.git")
md5sums=('SKIP')

pkgver() {
  cd contacts
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -d ${pkgdir}/usr/share/webapps/owncloud/apps
  cp -a ${srcdir}/contacts ${pkgdir}/usr/share/webapps/owncloud/apps/contacts
}
