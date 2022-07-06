# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgbase=arc-kde
pkgname=('arc-kde' 'kvantum-theme-arc')
pkgver=20220706
pkgrel=2
pkgdesc="Arc theme for KDE Plasma 5"
arch=(any)
url="https://github.com/PapirusDevelopmentTeam/${pkgbase}"
license=(GPL3)
options=(!strip)
source=(${pkgbase}-${pkgver}.tar.gz::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('17034da994a42b7f1139996705fb1377914c714ec25d4f39f2b6936984e9bbd3')

package_arc-kde() {
    optdepends=('kvantum-theme-arc: Arc theme for Kvantum Qt style (recommended)')

    cd ${pkgbase}-${pkgver}
    DESTDIR=$pkgdir IGNORE=Kvantum make install
}

package_kvantum-theme-arc() {
    pkgdesc="Arc theme for Kvantum"
    depends=('kvantum')

    cd ${pkgbase}-${pkgver}
    DESTDIR=$pkgdir THEMES=Kvantum  make install
}
