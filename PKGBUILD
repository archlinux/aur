# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgbase=adapta-kde
pkgname=('adapta-kde' 'kvantum-theme-adapta')
pkgver=20180828
pkgrel=1
pkgdesc="Adapta theme for KDE Plasma 5"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/${pkgbase}"
license=('GPL3')
options=('!strip')
source=(${pkgbase}-${pkgver}.tar.gz::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('7e55f4ed5c962c86d12b510bddcae1ac0018ffc95344e0b68218a98701907bdc')

package_adapta-kde() {
    optdepends=('adapta-gtk-theme: Matching GTK theme'
                'kvantum-theme-adapta: Adapta theme for Kvantum Qt style (recommended)')

    cd ${pkgbase}-${pkgver}
    install -d "${pkgdir}"/usr/share

    cp -r plasma "${pkgdir}"/usr/share
    cp -r aurorae "${pkgdir}"/usr/share
    cp -r color-schemes "${pkgdir}"/usr/share
    cp -r konsole "${pkgdir}"/usr/share
    cp -r yakuake "${pkgdir}"/usr/share
}

package_kvantum-theme-adapta() {
    pkgdesc="Adapta theme for KDE Plasma 5"
    depends=('kvantum-qt5')

    cd ${pkgbase}-${pkgver}
    install -d "${pkgdir}"/usr/share

    cp -r Kvantum "${pkgdir}"/usr/share
}
