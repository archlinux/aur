# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgbase=arc-kde
pkgname=(arc-kde kvantum-theme-arc)
pkgver=20220908
pkgrel=2
pkgdesc="Arc theme for KDE Plasma 5"
arch=(any)
url="https://github.com/PapirusDevelopmentTeam/${pkgbase}"
license=(GPL3)
options=(!strip)
source=(${pkgbase}-${pkgver}.tar.gz::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('bb4f547df20fc43fc19315cd0c96a447068abdc4095e7ae8b654a813e3422e93')
optdepends=(
  'arc-gtk-theme: Arc theme for GTK apps'
  'arc-icon-theme: Arc icon theme'
)

package_arc-kde() {
    optdepends+=('kvantum-theme-arc: Arc theme for Kvantum Qt style (recommended)')

    cd ${pkgbase}-${pkgver}
    DESTDIR=$pkgdir IGNORE=Kvantum make install
}

package_kvantum-theme-arc() {
    pkgdesc="Arc theme for Kvantum"
    depends=('kvantum')

    cd ${pkgbase}-${pkgver}
    DESTDIR=$pkgdir THEMES=Kvantum make install
}
