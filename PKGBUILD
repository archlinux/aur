# Maintainer: XZS <d dot f dot fischer at web dot de>
pkgname=python-argparse-manpager-git
pkgver=r0
pkgrel=1
pkgdesc="A generator and waf tool to make manual pages from executable python modules."
arch=('i686' 'x86_64')
url="https://github.com/dffischer/argparse-manpager"
license=('GPL3')
depends=('python')
makedepends=('waf')
optdepends=('waf: to use the corresponding waf tool')

# template input; name=git

build() {
	cd "$_gitname"
	waf --prefix=/usr configure build
}

package() {
	cd "$_gitname"
	waf install --destdir="$pkgdir/"
}
