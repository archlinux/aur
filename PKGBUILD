# Maintainer: katt <magunasu.b97 [at] gmail [dot] com>

_pkgname=gallery-dl
pkgname=$_pkgname-git
pkgver=1.11.0.r0.g6c86fbf
pkgrel=1
pkgdesc="Command-line program to download image-galleries and collections from several image hosting sites"
arch=('any')
url="https://github.com/mikf/gallery-dl"
license=("GPL2")
depends=('python' 'python-requests')
makedepends=('python' 'python-setuptools' 'git')
optdepends=('ffmpeg: Convert Pixiv Ugoira to WebM'
	    'youtube-dl: Download videos')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git+"$url")
sha512sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  python setup.py install -O1 --root="$pkgdir"
}
