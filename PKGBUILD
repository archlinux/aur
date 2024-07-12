# Maintainer:  Nate Levesque <public at thenaterhood dot com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Matej Horváth <matej.horvath@gmail.com>

pkgname=gscreenshot
pkgver=3.6.1
pkgrel=1
epoch=
pkgdesc="A simple screenshot tool supporting multiple backends"
arch=('any')
url="https://github.com/thenaterhood/gscreenshot"
license=('GPL')
groups=()
depends=("python"
        "python-pillow"
        "scrot"
        "gtk3"
        "python-setuptools"
        "python-gobject"
        "slop")
makedepends=("fakeroot"
        "gettext")
checkdepends=()
optdepends=('xclip: command line clipboard support'
            'xdg-utils: for opening screenshot files from gscreenshot'
            'pandoc: for generating the manpage at build (or use go-md2man)'
            'go-md2man: for generating the manpage at build (or use pandoc)'
            'slurp: for region selecton on Wayland'
            'wl-clipboard: Wayland clipboard support')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/thenaterhood/gscreenshot/archive/v$pkgver.tar.gz")
sha256sums=('980c3e232a5abe2bd7aec9c135ff7bea424a0a6398768659875ecf2e5945f661')
validpgpkeys=()

prepare() {
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
        python setup.py install --root="$pkgdir/" --optimize=1 --force --single-version-externally-managed
        chmod +x "$pkgdir/usr/bin/gscreenshot"
}
