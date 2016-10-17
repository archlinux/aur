# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=adapta-backgrounds
pkgver="0.1.0.7"
pkgrel=3
pkgdesc="Wallpaper collection for adapta-project"
arch=(any)
url="https://github.com/adapta-project/${pkgname}"
license=('GPL2' 'CCPL')
optdepends=('adapta-gtk-theme: The corresponding GTK theme')
makedepends=('glib2>=2.48.0'
             'libxml2')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('147d31a32beefc91dae4f9a14458dd2a165a28ac08d5f4c1d8d0ae6f93e92848')

build() {
    cd "${pkgname}-${pkgver}"
    ./autogen.sh
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
}

