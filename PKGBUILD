# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgbase=arc-kde
pkgname=('arc-kde' 'kvantum-theme-arc')
pkgver=20220810
pkgrel=1
pkgdesc="Arc theme for KDE Plasma 5"
arch=(any)
url="https://github.com/PapirusDevelopmentTeam/${pkgbase}"
license=(GPL3)
options=(!strip)
source=(${pkgbase}-${pkgver}.tar.gz::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('51e0fa6ba174f5882de152f7ce84e60c8619c67eeb1c4dfe5963c25b934ab66a')

package_arc-kde() {
    optdepends=('kvantum-theme-arc: Arc theme for Kvantum Qt style (recommended)')

    cd ${pkgbase}-${pkgver}
    DESTDIR=$pkgdir IGNORE=Kvantum make install
}

package_kvantum-theme-arc() {
    pkgdesc="Arc theme for Kvantum"
    depends=('kvantum')

    cd ${pkgbase}-${pkgver}
    DESTDIR=$pkgdir THEMES=Kvantum make install
}
