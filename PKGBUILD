# $Id$
# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>

pkgname=python2-mpldatacursor
pkgver=0.5.0
pkgrel=1
pkgdesc="Interactive data cursors (clickable annotation boxes) for matplotlib."
arch=('i686' 'x86_64')
url='https://github.com/joferkington/mpldatacursor'
license=('MIT')
depends=('python2-matplotlib>=0.9' 'python2-numpy>=1.1')

_gitroot=https://github.com/joferkington
_gitrepo=mpldatacursor

_tag=v${pkgver}
_dir=${_gitrepo}
source=("${_dir}"::"git+${_gitroot}/${_gitrepo}.git"#tag=${_tag})
md5sums=('SKIP')

build() {
    cd ${srcdir}/${_dir}
    python2 setup.py build
}

package() {
    cd ${srcdir}/${_dir}
    python2 setup.py install -O1 --skip-build --root "${pkgdir}" --prefix=/usr
}


