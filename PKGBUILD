pkgname=('python-jsbeautifier-git')
_pkgname="python-jsbeautifier"
pkgver=1.6.4.1546
pkgrel=1
pkgdesc="JavaScript unobfuscator and beautifier."
arch=('x86_64' 'i686')
url="https://github.com/beautify-web/js-beautify"
license=("MIT")
provides=('python-jsbeautifier')
depends=('python')
makedepends=('python')
source=("git+https://github.com/beautify-web/js-beautify.git")
md5sums=('SKIP')

pkgver() {
	cd js-beautify/python
	echo "$(python setup.py --version).$(git rev-list --count HEAD)"
}

build(){
    cd $srcdir
	# ..
}

package(){
    cd $srcdir/js-beautify
    install -D LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE

	cd python
    python setup.py install --root=$pkgdir/
}
