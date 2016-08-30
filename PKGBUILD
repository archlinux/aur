# Contributor: Daniele Paolella <daniele@promorange.com>
# Contributor: Dieter P
pkgname='dvcs-autosync-git'
pkgver=0.5.r193.584dfd8
pkgrel=1
pkgdesc="A personal Dropbox replacement based on Git"
arch=('any')
url="http://mayrhofer.eu.org/dvcs-autosync"
license=('GPL')
depends=('python2-pyinotify' 'xmpppy' 'python2')
makedepends=('git')
changelog=$pkgname.changelog
source=('git+https://github.com/rmayr/dvcs-autosync.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "0.5.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}
