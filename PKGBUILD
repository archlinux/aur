# Maintainer: Can Altıparmak (gulaghad) <can6dev <AT> gmail <DOT> com>

pkgname=python-markdown-figures-git
pkgver=2.59e8be5
pkgrel=1
pkgdesc="Extension for Python-Markdown to parse figure elements, optionally with a caption."
arch=('any')
url="http://github.com/helderco/markdown-figures"
license=('GPL2')
depends=('python-markdown')
makedepends=('git')
conflicts=('python-markdown-figures')
source=("$pkgname"::'git://github.com/helderco/markdown-figures')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    site=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")
    install -D "$srcdir/$pkgname/captions.py" "$pkgdir$site/markdown/extensions/captions.py"
}
