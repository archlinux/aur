# Maintainer:Martin C. Doege <mdoege at compuserve dot com>

pkgname=pyscape
pkgver=20150603.9be6e3c
pkgrel=1
pkgdesc="A Python soundscape tool"
arch=('any')
url="http://mdoege.github.com/PyScape/"
license=('GPL')
depends=('python2' 'tk' 'openal' 'freealut' 'python2-imaging')
makedepends=('git')
provides=('pyopenal')
conflicts=('pyopenal')
md5sums=('SKIP')
source=("git://github.com/mdoege/PyScape.git")
_gitname="PyScape"
PKGEXT='.pkg.tar'

pkgver() {
	cd "$_gitname"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

package() {
	cd ${_gitname}
	python2 setup.py install --root="$pkgdir/" --optimize=1
	mkdir -p $pkgdir/usr/share/icons
	cp desktop/pyscape.svg $pkgdir/usr/share/icons
	mkdir -p $pkgdir/usr/share/applications
	cp desktop/pyscape.desktop $pkgdir/usr/share/applications
	mkdir -p $pkgdir/usr/share/locale/de/LC_MESSAGES
	cp mo/de/LC_MESSAGES/pyscape.mo $pkgdir/usr/share/locale/de/LC_MESSAGES/
}
