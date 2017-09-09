# Maintainer: Savvy Raghuvanshi <sraghuvanshi at college dot harvard dot edu>
# Author: Nick <https://github.com/nick92>

pkgname=lightdm-enso-os-greeter-git
pkgver=16
pkgrel=1
pkgdesc="A fork of Pantheon greeter."
arch=('any')
url="https://github.com/nick92/Enso-OS/greeter"
license=('GPL')
depends=('cairo' 'clutter' 'clutter-gtk' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgee' 'libgl' 'libx11' 'lightdm' 'vala')
makedepends=('cmake' 'svn' 'git')
conflicts=('lightdm-pantheon-greeter')
source=("$pkgname::svn+https://github.com/nick92/Enso-OS.git/trunk/greeter")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    echo "$(svnversion)"
}

build() {
    cd "$pkgname"
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}


package() {
    cd "$pkgname"
    cd build/
    sudo make install
}
