# Maintainer: Caleb Maclennan <caleb@alerque.com>
#
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: noirbizarre <noirbizarre@gmail.com>
# Contributor: Wael Nasreddine <wael.nasreddine@gmail.com>

pkgname=git-crypt-git
pkgver=0.6.0_0_g546664f
pkgrel=1
_branch=master
pkgdesc="Transparent file encryption in Git"
arch=('i686' 'x86_64')
url="http://www.agwa.name/projects/${pkgname%-git}/"
license=('GPL3')
makedepends=('git')
depends=('git' 'openssl')
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
