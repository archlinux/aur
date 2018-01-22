# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=adapta-backgrounds
pkgver="0.5.3.1"
pkgrel=1
pkgdesc="Wallpaper collection for adapta-project"
arch=(any)
url="https://github.com/adapta-project/${pkgname}"
license=('GPL2' 'CCPL')
optdepends=('adapta-gtk-theme: The corresponding GTK theme')
makedepends=('glib2>=2.48.0'
             'libxml2'
             'meson')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('18fd7304bd30139161c9dca6b62862deb6c63f2159314539c972498c51770769')

prepare() {
    cd "${pkgname}-${pkgver}"
    meson build --prefix=/usr
}

build() {
    cd "${pkgname}-${pkgver}/build"
    ninja
}

package() {
    cd "${pkgname}-${pkgver}/build"
    DESTDIR="$pkgdir" ninja install
}

