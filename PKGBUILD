# Maintainer: Stefano Capitani <stefano@manjaro.org>

_pkgbase=gnome-shell-extension-desktop-icons
pkgname=$_pkgbase-reworked
pkgver=0.2
pkgrel=2
_commit=7512f35108c2c462310bf9c7f8e4a4580c1ae748
_ext_dir=org.gnome.desktop-icons-reworked
pkgdesc="Add icons to the desktop"
arch=('any')
url="https://github.com/Ste74/$_ext_dir"
license=("LGPL3")
depends=('gnome-shell' 'gnome-shell-extensions')
makedepends=('cmake')
conflicts=("$_pkgbase")
options=('!strip')
source=("$url/archive/$_commit.tar.gz")
sha512sums=('593b919f8e84c28da5b303b1b91f282b5fcdc143a4547f46ef81029abc226ad0a16349b8ff603c0d71e9b6d1f8da9a838d6aa5a44caeead080440ed805ea98e4')

build() {
    mkdir -p $_ext_dir-$_commit/build
    cd $_ext_dir-$_commit/build
    cmake ../
    make
}

package() {
	cd $_ext_dir-$_commit/build
    make DESTDIR="${pkgdir}" install
}
