# Maintainer: katt <magunasu.b97@gmail.com>

_pkgname=gallery-dl
pkgname=$_pkgname-git
pkgver=1.13.5.r11.gb47cfc5
pkgrel=1
pkgdesc='Command-line program to download image-galleries and collections from several image hosting sites'
arch=('any')
url='https://github.com/mikf/gallery-dl'
license=('GPL2')
depends=('python' 'python-requests')
makedepends=('python-setuptools' 'git')
optdepends=('ffmpeg: Convert Pixiv Ugoira to WebM'
            'youtube-dl: Download videos')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname"::git+"$url")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    python setup.py install -O1 --root="$pkgdir"
}
