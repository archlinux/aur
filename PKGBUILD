# Maintainer: Romain Porte <microjoe@mailoo.org>

pkgname=libgd-doc-git
pkgver=gd.2.1.1.30.g10a1b82
pkgrel=2
pkgdesc="Reference documentation for libgd, HTML format."
arch=('any')
url="https://bitbucket.org/libgd/gd-libgd/"
license=('unknown')
conflicts=('libgd-doc')
makedepends=('git' 'naturaldocs')
source=(git+https://bitbucket.org/libgd/gd-libgd/)
md5sums=('SKIP')

_gitname='gd-libgd'

pkgver() {
	cd "$_gitname"
	git describe --tags | sed 's/-/./g'
}

build() {
	cd "$_gitname/docs/naturaldocs"

	./run_docs.sh
}

package() {
	cd "$_gitname/docs/naturaldocs"

	mkdir -p $pkgdir/usr/share/doc/libgd
	cp -r html/ $pkgdir/usr/share/doc/libgd/
}
