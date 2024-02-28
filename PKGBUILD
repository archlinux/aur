# Maintainer: Petr Kracik <petrkr@petrkr.net>
# Based on dbeaver-ee maintaned by John Sivak <jsivak@winterjewel.com>

pkgname=dbeaver-le
pkgver=23.3.0
pkgrel=1
pkgdesc="A universal database tool for developers and database administrators. Lite Edition"
arch=('x86_64')
url="http://dbeaver.com/"
license=("Commercial")
depends=('java-runtime>=11' 'gtk3' 'gtk-update-icon-cache')
install=dbeaver-le.install

source=(dbeaver-le.desktop dbeaver-le.install)
source_x86_64=(http://dbeaver.com/downloads-lite/${pkgver}/dbeaver-le-${pkgver}-linux.gtk.x86_64-nojdk.tar.gz)
sha256sums=('9d985ebe0332caf09fdee3fbe1e97b4f29533fe84911df46556623dff457a4ee'
            '0c2a75baa39459fa56159e982d9f28c966837561bd52dffd24bac87b8d65555f')
sha256sums_x86_64=('9f1ca41a62e4deb37dea21dea8dd2de2076c4d4564b9f1d3d116fd96a78700c4')


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
