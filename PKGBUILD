# Maintainer:  Nate Levesque <public at thenaterhood dot com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Matej Horváth <matej.horvath@gmail.com>

pkgname=gscreenshot
pkgver=2.3.2
pkgrel=1
epoch=
pkgdesc="A GUI front-end for scrot"
arch=('any')
url="https://github.com/thenaterhood/gscreenshot"
license=('GPL')
groups=()
depends=("python"
        "python-pillow"
        "scrot"
        "pygtk"
        "gtk3"
        "python-setuptools"
        "python-gobject")
makedepends=("unzip"
        "fakeroot")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/thenaterhood/gscreenshot/archive/v$pkgver.zip")
noextract=("v$pkgver.zip")
sha256sums=('e30b3a33382176f1e8178e17977cf87bdbd66a56ef8aa4ca116286309292b540')
validpgpkeys=()

prepare() {
        unzip $srcdir/v$pkgver.zip
        cd $srcdir/gscreenshot-$pkgver
}

build() {
        echo "Nothing to build"
}

check() {
        echo "Nothing to check"
}

package() {
        echo $pkgdir
        cd $srcdir/gscreenshot-$pkgver
        python setup.py install --root="$pkgdir/" --optimize=1
        chmod +x "$pkgdir/usr/bin/gscreenshot"
        install -Dm644 dist/$pkgname.desktop \
            "$pkgdir/usr/share/applications/$pkgname.desktop"
        install -Dm644 dist/black-white_2-Style-applets-screenshooter.png \
            "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
