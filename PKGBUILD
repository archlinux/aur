# Maintainer: Petr Kracik <petrkr@petrkr.net>
# Based on dbeaver-ee maintaned by John Sivak <jsivak@winterjewel.com>

pkgname=dbeaver-le
pkgver=26.0.0
pkgrel=1
pkgdesc="A universal database tool for developers and database administrators. Lite Edition"
arch=('x86_64')
url="http://dbeaver.com/"
license=("Commercial")
depends=('gtk3' 'gtk-update-icon-cache')
install=dbeaver-le.install
options=('!strip')

source=(dbeaver-le.desktop dbeaver-le.install)
source_x86_64=(http://downloads.dbeaver.net/lite/${pkgver}/dbeaver-le-${pkgver}-linux-x86_64.tar.gz)
sha256sums=('9d985ebe0332caf09fdee3fbe1e97b4f29533fe84911df46556623dff457a4ee'
            '0c2a75baa39459fa56159e982d9f28c966837561bd52dffd24bac87b8d65555f')
sha256sums_x86_64=('67933e2bbba8405c3ae4fda9b8b268acfc8730465c9808abb166dc9cf1429d24')


package() {
    cd $pkgdir
    mkdir -p "opt"
    mkdir -p "usr/bin"
    mkdir -p "usr/share/doc/${pkgname}"
    mkdir -p "usr/share/licenses"
    mkdir -p "usr/share/applications"
    mkdir -p "usr/share/icons/hicolor/48x48/apps"

    cp -r "${srcdir}/dbeaver" "opt/${pkgname}"
    cp "opt/${pkgname}/icon.xpm" "usr/share/icons/hicolor/48x48/apps/${pkgname}.xpm"
    cp "${srcdir}/dbeaver/readme.txt" "usr/share/doc/${pkgname}/"
    cp -r "${srcdir}/dbeaver/licenses" "usr/share/licenses/${pkgname}"

    ln -s "/opt/${pkgname}/dbeaver" "usr/bin/dbeaver-le"
    install -m 644 "${srcdir}/dbeaver-le.desktop" "usr/share/applications/"
}
