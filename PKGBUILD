# Maintainer: Sean Snell <ssnell at cmhsol dot com>

pkgname=cysboard-git
_gitname=Cysboard
pkgver=1.0
pkgrel=1
pkgdesc='A lightweight system monitor with html and css for themes. Latest commit from the master branch on Github.'
arch=(any)
url=https://github.com/mike168m/Cysboard
license=('GPL3')
makedepends=('git' 'automake')
depends=('when-changed-git')
source=("git://github.com/mike168m/${_gitname}.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/${_gitname}"
	./sources/resources/compile.sh --prefix=/usr
	make
}

package() {
  	cd "${srcdir}/${_gitname}"
	make DESTDIR="$pkgdir" install
}
