# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-tasks
pkgver=0.8.1
pkgrel=1
pkgdesc="Enhanced task app for ownCloud"
arch=('any')
url="https://github.com/owncloud/tasks"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("tasks-${pkgver}.tar.gz::https://github.com/owncloud/tasks/archive/v${pkgver}.tar.gz")
sha512sums=("5b0880cd86588142d32f77dbcdd3fe7406541b790012528ba8efdceb62d0638a7d4b11e91b5fd3f0c5b4f5cfb3ae8213b28a41b4e7fa0fa0a8e978163175ec00")

build() {
  cd "${srcdir}/tasks-${pkgver}"
  rm build.xml CONTRIBUTING.md .gitattributes .gitignore README.md .scrutinizer.yml .travis.yml
}

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -r "${srcdir}/tasks-${pkgver}" "${pkgdir}/usr/share/webapps/owncloud/apps/tasks"
}
