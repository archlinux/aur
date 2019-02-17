# Maintainer: Manuel Domínguez López
# <mdomlop at gmail dot com>
# @mdomlop at telegram

_pkgver_year=2019
_pkgver_month=02
_pkgver_day=17

pkgname=retrosmart-x11-cursors
pkgver=1.0b
pkgrel=1
pkgdesc="A retrosmart look collection of cursors for X."
url="https://github.com/mdomlop/$pkgname"
source=("https://github.com/mdomlop/$pkgname/archive/$pkgver.tar.gz")
md5sums=('04c42a604e316abd7067237647e537fa')
license=('GPL3')
builddepends=('imagemagick' 'xorg-xcursorgen')
optdepends=('retrosmart-kvantum-theme: The corresponding theme for Kvantum'
            'retrosmart-qtcurve-theme: The corresponding theme for QtCurve'
            'retrosmart-gtk-themes: The corresponding GTK themes'
            'retrosmart-openbox-themes: The corresponding Openbox themes'
            'retrosmart-wallpapers: The corresponding backgrounds project'
            'retrosmart-xfwm4-themes: The corresponding XFwm4 themes')
arch=('any')
group=('retrosmart')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure
    }

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
    }

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DESTDIR=$pkgdir
}
