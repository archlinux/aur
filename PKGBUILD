# Maintainer: Faule Socke <github@socker.lepus.uberspace.de>

pkgname=python-pyassimp-git
pkgver=git-1
pkgrel=1
pkgdesc="Portable Open Source library to import various well-known 3D model formats in an uniform manner. Python binding."
arch=(i686 x86_64)
url="http://assimp.sourceforge.net/"
license=('BSD')
depends=('python' 'assimp')
makedepends=('git')
conflicts=()
options=()
source=('git://github.com/assimp/assimp.git')
md5sums=('SKIP')
_gitname="assimp"

pkgver() {
    cd $_gitname
    git describe --always | sed 's|-|.|g'
}

package() {
    cd "$_gitname/port/PyAssimp/"
    python setup.py install --root="$pkgdir/" --optimize=1
}

