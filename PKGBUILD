# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>
_pkgname=grive-indicator
pkgname=$_pkgname-git
pkgver=0.5
pkgrel=2
pkgdesc='A very simple and lightweight indicator applet to synchronize with Google Drive using grive'
arch=('any')
url='https://github.com/LyzardKing/grive-indicator'
license=('GPL')
depends=('grive' 'python2-libappindicator')
makedepends=('git' 'python')
source=('grive-indicator::git+https://github.com/LyzardKing/grive-indicator.git')
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$_pkgname"

  python setup.py install --root="$pkgdir"
}
