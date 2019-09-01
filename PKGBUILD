# Maintainer: Antonino Maniscalco <antomani103@pm.me>

pkgbase=('vbar')
pkgname=('vbextreme-bar-git')
pkgdesc="another statuts bar"
pkgver=master
pkgrel=1
arch=('x86_64')
url='https://github.com/vbextreme/vbar'
replaces=(vbar-i3wm vbar-dwm)
conflicts=(vbar-i3wm vbar-dwm)
license=('GPLv3')
makedepends=('gperf' 'meson')
source=('git+https://github.com/vbextreme/vbar.git')
sha256sums=('SKIP')

prepare() {
    cd $pkgbase
    meson build
}

build() {
    cd "$srcdir"/"$pkgbase"/build
    meson configure --prefix /usr
    ninja
}

package() {
    cd "$srcdir"/"$pkgbase"/build
    DESTDIR="$pkgdir" ninja install
}

