# Maintainer : Yamada Hayao <hayao@fascode.net>
# Contributer: Bernhard Landauer <oberon@manjaro.org>

pkgname="xfce4-calculator-plugin"
_maj=0.7
pkgver="${_maj}.1"
pkgrel=1
pkgdesc="Calculator plugin for the Xfce4 panel."
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/panel-plugins/${pkgname}"
license=('GPL')
depends=('intltool' 'xfce4-panel')
install="${pkgname}.install"
source=("https://archive.xfce.org/src/panel-plugins/xfce4-calculator-plugin/${_maj}/xfce4-calculator-plugin-${pkgver}.tar.bz2")
sha256sums=('e4016a03c3ef4ebddd97e4135f5e304f80677033c98e19644b9989ec6f5ada81')

build() {
    cd "${pkgname}-${pkgver}"
    [[ -f "./Makefile" ]] && make distclean
    "./configure" --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib --disable-static
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

