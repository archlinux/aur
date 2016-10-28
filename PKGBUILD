# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=adapta-backgrounds
pkgver="0.2.0.2"
pkgrel=1
pkgdesc="Wallpaper collection for adapta-project"
arch=(any)
url="https://github.com/adapta-project/${pkgname}"
license=('GPL2' 'CCPL')
optdepends=('adapta-gtk-theme: The corresponding GTK theme')
makedepends=('glib2>=2.48.0'
             'libxml2')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('18675f791382b2f0fcf9dfb19a3c42a595d34a2884f046dc62fbaa4eb95f5797')

build() {
    cd "${pkgname}-${pkgver}"
    ./autogen.sh
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
}

