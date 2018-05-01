# Maintainer: Stefano Capitani <stefano@manjaro.org>

_pkgbase=gnome-shell-extension-desktop-icons
pkgname=$_pkgbase-reworked
pkgver=0.2
pkgrel=1
_commit=4cbb25bfbbf9022a298865c9e91f7078d35477db
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
sha512sums=('df7156e3839ab6f142959d00333ae25e9d1d75a067b27723cdc003bba595a6cfb2c0ff8e8664e4715931a17c9cdd24c9ff3a879ade4a89df37e5b2b8b8a098b1')

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
