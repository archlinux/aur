# Maintainer: Saeed Rasooli <saeed.gnu at gmail dot com>

pkgname=starcal2-git
pkgver=2015.04.27
pkgrel=1
pkgdesc='A full-featured international calendar writen in Python'
arch=('any')
url=(http://starcal.sourceforge.net)
license=('GPLv3')
depends=('python2>=2.6' 'pygtk>=2.8' 'pygobject' 'python2-pytz')
optdepends=('python2-igraph' 'python2-gflags' 'python2-httplib2' 'python2-gnomevfs')
makedepends=('git')
conflicts=('starcal2')
source=('git://github.com/ilius/starcal.git'
	'patch.install')
_gitname='starcal'
md5sums=('SKIP'
	'8e8805cd60fc15a1e5031a4c3742beca')

pkgver() {
  date +%Y.%m.%d
}

prepare() {
    cd "${_gitname}"
    patch -p1 < "$srcdir"/install.patch
}

package() {
    "$srcdir/${_gitname}/install" "$pkgdir" --for-pkg
}
