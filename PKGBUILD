# Maintainer: Ícar N. S. <icar dot nin at pm dot me>

pkgname=setzer-git
_gitname=Setzer
pkgver=v0.4.1
pkgrel=1
pkgdesc="LaTeX editor written in Python with Gtk"
arch=('any')
url="https://github.com/cvfosammmm/Setzer"
license=('GPL3')
depends=('gtk3' 'gtksourceview4' 'poppler-glib' 'texlive-core' 'gspell' 'python-pyxdg' 'python-pdfminer' 'python-gobject' 'pango' 'webkit2gtk' 'gettext' 'xdg-utils' 'python-cairo')
makedepends=('git' 'meson')
source=("https://github.com/cvfosammmm/Setzer/archive/${pkgver}.tar.gz")
md5sums=('768b02949d35b83007a5388d8e8ae8af')

build() {
    cd "${srcdir}/${_gitname}-${pkgver:1}"
	arch-meson . _build --prefix=/usr
	ninja -C _build
}

package() {
    cd "${srcdir}/${_gitname}-${pkgver:1}"
    DESTDIR="${pkgdir}" ninja -C _build install
}
