# Maintainer: steve ::at:: tuxcon "dot" com

pkgname=imgur-downloader-git
_appname=imgur_downloader
pkgver=0.0.1.git
pkgrel=1
pkgdesc="Download imgur albums from the command line"
license=('MIT')
url="https://github.com/jtara1/imgur_downloader"
arch=('any')
groups=()
depends=('python')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/jtara1/imgur_downloader.git')
sha1sums=('SKIP')

build() {
  cd $srcdir/${_appname}
  python setup.py bdist
}


package() {
    _pkg=$(ls "$srcdir/$_appname/dist/")
    tar -xC "$pkgdir/" -f "$srcdir/$_appname/dist/$_pkg"

    mkdir -p "$pkgdir/usr/bin"
}
