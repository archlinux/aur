# Maintainer: Onur BÜBER <onurbuber@engineer.com>
# Developer: Ari Archer <ari.web.xyz@gmail.com>

pkgname=arigram
pkgver=0.1.5
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
sha256sums=('ea377ef7b655c5244a455990fa850f3c4776bbba656074b20dcaf36c5f54bdf2')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build

}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir"
    install -Dm644 UNLICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
