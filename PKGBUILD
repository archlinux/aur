# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=browser360
pkgver=10.0.2001.0
pkgrel=2
pkgdesc="A chromium based web browser from Qihoo 360"
arch=('x86_64')
url="https://browser.360.cn/se/"
license=('custom')
depends=(
    'ca-certificates'
    'ttf-liberation'
    'gconf'
    'libappindicator-gtk3'
    'gconf'
    'gtk2'
    'nss'
    'libxss'
    'lsb-release'
    'wget'
    'xdg-utils'
)
source=(
    'ftp://zyiot.top/pub/aur/browser360-cn-stable_10.0.2001.0-2_amd64.deb'
)
md5sums=(
    'cd23bd055b040cb055907288e4623ddc'
)

package() {
    cd "${srcdir}"
    tar -xf data.tar.xz -C "${pkgdir}"
    # remove cron
    rm -rf "${pkgdir}"/etc
    # install icons
    for i in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${pkgdir}"/opt/browser360/product_logo_${i/x*}.png \
                        "${pkgdir}"/usr/share/icons/hicolor/$i/apps/${pkgname}.png
    done
    rm "${pkgdir}"/opt/browser360/product_logo_*
}
