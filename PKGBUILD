# Maintainer: Manuel Domínguez López <mdomlop at gmail dot com>

_pkgver_year=2017
_pkgver_month=07
_pkgver_day=12

pkgname=retrosmart-openbox-themes
pkgver=1
pkgrel=1
pkgdesc="Retrosmart Openbox themes."
url="https://github.com/mdomlop/${pkgname}"
source=("https://github.com/mdomlop/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('4e10ceef110577df40878e3e604661b8')
license=('GPL3')
makedepends=('python')
optdepends=('retrosmart-gtk-themes: The corresponding GTK themes'
            'retrosmart-icon-themes: The corresponding icon theme'
            'retrosmart-wallpapers: The corresponding backgrounds project'
            'retrosmart-x11-cursors: The corresponding X11 cursor theme'
            'retrosmart-xfwm4-themes: The corresponding XFwm4 themes')
arch=('any')
group=('retrosmart')


build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure
    make
    }

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install PREFIX=${pkgdir}/usr
}
