# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qianxin-browser-stable
_pkgname=qaxbrowser-safe-stable
pkgver=1.0.41603.7
pkgrel=1
epoch=
pkgdesc="奇安信可信浏览器国密开发者专版"
arch=("x86_64")
url="https://www.qianxin.com/product/detail/pid/333"
license=('custom:development')
depends=(
	'libxkbcommon'
	'alsa-lib'
	'gtk2'
	'mesa'
	'nss'
	'at-spi2-core'
	)
optdepends=( )
conflicts=()
provides=("QiAnXin")
install=
#source=("https://down.360safe.com/gc/signed_${_pkgname}_${pkgver}-${pkgrel}_amd64.deb")
source=("https://dl.qianxin.com/c8a52014-99d3-57ff/41603/${_pkgname}_${pkgver}-1_amd64.deb")
md5sums=('b3f0722b495a6dabdf0e9e989960333e')
 
prepare() {
    bsdtar -xf data.tar.xz
}
 
package() {
    cp --parents -a {etc/cron.daily,opt,usr/bin,usr/share,} "${pkgdir}"
    #install icons
    for i in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${pkgdir}/opt/qianxin.com/qaxbrowser/product_logo_${i/x*}.png" \
                "${pkgdir}/usr/share/icons/hicolor/${i}/apps/qaxbrowser-safe.png"
    done
}
