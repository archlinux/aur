# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-tasks
pkgver=0.8
pkgrel=1
pkgdesc="Enhanced task app for ownCloud"
arch=('any')
url="https://github.com/owncloud/tasks"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("tasks-${pkgver}.tar.gz::https://github.com/owncloud/tasks/archive/v${pkgver}.tar.gz")
sha512sums=("f69f9ac50ae7aa10036a35cf20ac3aa89a5c41617f811d04e6026438c0f8ceeda764621ccf5bbe2f086ce29c12260b65ee1db208ff8d74c183d55970d4c9af4a")

build() {
  cd "${srcdir}/tasks-${pkgver}"
  rm build.xml CONTRIBUTING.md .gitattributes .gitignore README.md .scrutinizer.yml .travis.yml
}

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -r "${srcdir}/tasks-${pkgver}" "${pkgdir}/usr/share/webapps/owncloud/apps/tasks"
}
