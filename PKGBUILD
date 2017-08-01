# Maintainer: Jan Max Meyer <codepilot@phorward.info>
_txt2tags=txt2tags
pkgname=$_txt2tags-git
pkgver=2.6.99
pkgrel=1
epoch=
pkgdesc="A text formatting and conversion tool - Development version"
arch=('any')
url="http://www.txt2tags.org"
license=('GPL')
conflicts=("$_txt2tags")
depends=('python2')
optdepends=('ruby: for running t2tmake.rb'
            'sh: for running html-update.sh'
            'vim: for using the vim-files')
makedepends=('gettext', 'git')
source=("git://github.com/txt2tags/txt2tags.git")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
}

check() {
	cd "$pkgname-$pkgver"
	python2 setup.py check
}

package() {
	cd "$pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir/"
}

