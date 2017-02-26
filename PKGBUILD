# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Akira Ohgaki <akiraohgaki@gmail.com>

pkgname=xdgurl
_pkgname=ocs-url
pkgver=2.0.3
pkgrel=2
pkgdesc='An install helper program for desktop stuff.'
arch=('i686' 'x86_64')
url="https://github.com/$pkgname/$pkgname"
license=('GPL3')
depends=('qt5-base>=5.3.0'
        'qt5-declarative>=5.3.0'
        'qt5-quickcontrols>=5.3.0'
        'qt5-svg>=5.3.0')
source=("$_pkgname-$pkgver::$url/archive/release-$pkgver.tar.gz")
md5sums=('1f527b6452836ca1b6db75af6dc9e223')

build() {
    cd "$_pkgname-release-$pkgver"
    qmake PREFIX='/usr'
    make
}

package() {
    cd "$_pkgname-release-$pkgver"
    make INSTALL_ROOT="$pkgdir" install
}
