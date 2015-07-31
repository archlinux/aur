# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=owncloud-app-tasks
pkgver=0.7.1
pkgrel=1
pkgdesc="Enhanced task app for ownCloud"
arch=('any')
url="https://github.com/owncloud/tasks"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("tasks-${pkgver}.tar.gz::https://github.com/owncloud/tasks/archive/v${pkgver}.tar.gz")
sha512sums=("c9c9772e9209412850261b6f468d797263a9f0df44661d96f2d36e91f5529b9c38cd1ef4381f170213f3937f4552105d2c71eac3365bc830e93d58eeb1d9f7b5")

build() {
  cd "${srcdir}/tasks-${pkgver}"
  rm build.xml CONTRIBUTING.md .gitattributes .gitignore README.md .scrutinizer.yml .travis.yml
}

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -r "${srcdir}/tasks-${pkgver}" "${pkgdir}/usr/share/webapps/owncloud/apps/tasks"
}
