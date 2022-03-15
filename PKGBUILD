# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=gtk-theme-plano
_pkgname=plano-theme
_pkgauthor=lassekongo83
pkgver=4.0
pkgrel=1
pkgdesc='flat GTK+ theme'
arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('GPL3')
makedepends=('meson' 'ninja' 'sassc')
optdepends=('ttf-roboto: for the GNOME shell theme'
            'gtk-engines: for the GTK2 theme'
            'gtk-engine-murrine: for the GTK2 theme')
conflicts=('gtk-theme-plano-git')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/lassekongo83/${_pkgname}/archive/v${pkgver/%.1/-1}.tar.gz)
sha256sums=('c33ac656c0895b81fc9491d2921fa0d6a8c8224169bd35efc7d45137663d0a12')


build() {
    meson --prefix=/usr "${_pkgname}-${pkgver/%.1/-1}" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
