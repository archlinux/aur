# Maintainer: Jan Max Meyer <codepilot@phorward.info>
_pkgname=txt2tags
pkgname=$_pkgname-git
pkgver=2.6.99
pkgrel=1
epoch=
pkgdesc="A text formatting and conversion tool - Development version"
arch=('any')
url="http://www.txt2tags.org"
license=('GPL')
conflicts=("$_pkgname")
depends=('python2')
optdepends=('ruby: for running t2tmake.rb'
            'sh: for running html-update.sh'
            'vim: for using the vim-files')
makedepends=('git')
source=("git://github.com/txt2tags/txt2tags.git")
md5sums=('SKIP')

check() {
	cd "$srcdir/$_pkgname"
	python2 setup.py check
}

package() {
	cd "$srcdir/$_pkgname"
	python2 setup.py install --root="$pkgdir/"
}

