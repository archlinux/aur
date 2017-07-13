# Maintainer: Manuel Domínguez López <mdomlop at gmail dot com>

pkgname=retrosmart-openbox-themes
pkgver=1
pkgrel=1
pkgdesc="Retrosmart Openbox themes."
url="https://github.com/mdomlop/${pkgname}"
source=("https://github.com/mdomlop/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('1693d857f5151dc083e162b6f36de126')
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
