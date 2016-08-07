# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mate-applet-lockkeys
pkgver=0.2.4
pkgrel=1
pkgdesc="A MATE panel applet that shows which of the CapsLock, NumLock and ScrollLock keys are on and which are off."
url="http://www.zavedil.com/mate-lock-keys-applet/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'mate-panel')
makedepends=('mate-common' 'perl-xml-parser' 'yelp-tools')
source=("http://www.zavedil.com/wp-content/uploads/2015/01/${pkgname}-${pkgver}.tar.gz")
md5sums=('66555216ec6d07aa2496ebc76bcbc131')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${pkgname}
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    rm -f "${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled"
}
