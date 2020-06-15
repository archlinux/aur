# Maintainer: katt <magunasu.b97@gmail.com>

_pkgname=fahcontrol
pkgname=$_pkgname-git
pkgver=r82.91e9fe6
pkgrel=1
pkgdesc='Folding@home Client Advanced Control GUI - git version'
arch=(any)
url='https://foldingathome.org'
license=('GPL')
depends=('python2' 'pygtk')
optdepends=('fahviewer: 3D simulation viewer')
makedepends=('git' 'python2-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+https://github.com/FoldingAtHome/fah-control"
		"FAHControl.desktop")
md5sums=('SKIP'
         '81c1953f5c7cfb981ba1b7bf6a046f88')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	python2 setup.py install --root="$pkgdir"
	install -Dm644 FAHControl.desktop -t "$pkgdir"/usr/share/applications
}
