# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=git-crypt-git
pkgver=0.5.0_1_ge0b3bd7
pkgrel=1
_branch=master
pkgdesc="Transparent file encryption in Git"
arch=('i686' 'x86_64')
url="http://www.agwa.name/projects/${pkgname%-git}/"
license=('GPL3')
makedepends=('git')
depends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git://github.com/AGWA/${pkgname%-git}.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/-/_/g'
}

build() {
  cd "${pkgname%-git}"
  make PREFIX=/usr
}

package() {
  cd "${pkgname%-git}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
