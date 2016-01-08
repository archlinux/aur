# Maintainer: Ecmel B. CANLIER <ecbercnlmc(at)gmail.com>
pkgname=webdz-git
pkgver=1.0DEV
pkgrel=3
pkgdesc="Cleans up unminified, unneeded etc. files from your website project and creates a zip archive."
url="https://github.com/Admicos/webdz"
arch=('any')
license=('MIT')
depends=('java-runtime')
makedepends=('unzip' 'gradle' 'git')
provides=('webdz')
conflicts=('webdz')
source=("webdz::git+https://github.com/Admicos/webdz")
md5sums=('SKIP')

pkgver() {
  cd "webdz"
  eval $(sed 's/\-//' res/webdz.properties)
  echo $version
}

build() {
  cd "webdz"
  gradle distZip
}

package() {
  cd "webdz"
  unzip webdz-distributeMe.zip -d $pkgdir
}
