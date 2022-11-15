# Maintainer: Onur BÜBER <onurbuber@engineer.com>
# Developer: Ari Archer <ari.web.xyz@gmail.com>

pkgname=arigram
pkgver=0.1.3
pkgrel=1
pkgdesc='A fork of tg -- a hackable telegram TUI client'
arch=('x86_64')
url='https://github.com/TruncatedDinosour/arigram.git'
license=('Unlicense')
provides=('arigram')
conflicts=('arigram')
optdepends=('ffmpeg'
	    	'nnn'
	    	'fzf'
	    	'ranger')
makedepends=('python'
		     'python-pip'
		     'python-telegram'
	     	 'python-pyfzf'
	     	 'python-pyperclip'
         	 'bash'
	     	 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TruncatedDinosour/arigram/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('101a89fd7c1f1343052a9f138670acc4dd57f070440258aaaac2d37d85435f75')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build

}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir"
    install -Dm644 UNLICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
