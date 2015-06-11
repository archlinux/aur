# Maintainer : FredBezies <fredbezies at gmail dot com>
# Based on the work of chaoswizard
# Only git version could be built, so...

pkgname=pluzzdl-git
_gitname=pluzzdl
pkgver=0.9.4.r8.g28a731c
pkgrel=2
pkgdesc="Software to retreive videos from French website pluzz."
url="https://github.com/mrtvfuencxozd/pluzzdl"
depends=('python2' 'python2-crypto' 'python2-socksipy-git' 'python2-beautifulsoup3' 'ffmpeg')
makedepends=('git')
provides=('pluzzdl')
conflicts=('pluzzdl')
license=('GPL2')
arch=('any')
source=(git+https://github.com/mattetti/pluzzdl.git
	scriptfix.patch)
md5sums=('SKIP'
         '62578fcf3bc01b9adc3206fd6ed2363c')

pkgver() {
	cd "${srcdir}/$_gitname"
	echo "0.9.4.r$(git rev-list --count master).g$(git log -1 --format="%h")"
}

build() {
    cd "${srcdir}/$_gitname"
    patch -p1 -i ${srcdir}/scriptfix.patch
    make PYTHON_VERSION=python2 
}
package() {
    cd "${srcdir}/$_gitname"
    make PREFIX=$pkgdir/usr PYTHON_VERSION=python2 install
}


md5sums=('SKIP'
         '99a4bb88c4833983c9c8c577a4d4f172')
md5sums=('SKIP'
         'bf220195cb5cd4a0c8b9d9227456619c')
