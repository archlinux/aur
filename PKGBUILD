# Maintainer: Manuel Domínguez López <mdomlop at gmail dot com>

pkgname=retrosmart-openbox-themes
pkgver=1
pkgrel=1
pkgdesc="Retrosmart Openbox themes."
url="https://github.com/mdomlop/${pkgname}"
source=("$pkgname-$pkgver.tar.gz::https://github.com/mdomlop/$pkgname/archive/$pkgver.tar.gz")
md5sums=('1693d857f5151dc083e162b6f36de126')
license=('GPL3')
makedepends=('python')
optdepends=('xcursor-retrosmart: The corresponding X11 cursor theme'
            'retrosmart-aurorae-themes: The corresponding Aurorae themes'
            'retrosmart-kvantum-theme: The corresponding theme for Kvantum'
            'retrosmart-qtcurve-theme: The corresponding theme for QtCurve'
            'retrosmart-xfwm4-themes: The corresponding themes for XFwm4'
            'retrosmart-icon-theme: The corresponding icon theme')
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
