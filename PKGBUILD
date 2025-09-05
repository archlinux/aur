# Maintainer: BryanLiang <liangrui.ch at gmail dot com>
# Contributor: Ziqi Yang <mr.ziqiyang@gmail.com>

# shellcheck disable=SC2034,SC2154,SC2164

pkgname='ttf-lxgw-neo-xihei-screen-full'
pkgver=25.09.05
pkgrel=1
pkgdesc="霞鹜新晰黑屏幕阅读版Droid Sans Fallback打底补全版，更适合 PC 及 Android 手机屏幕显示。"
arch=("any")
url="https://github.com/lxgw/LxgwNeoXiHei-Screen"
license=("IPA")
source=("${pkgname}-${pkgver}-${pkgrel}.ttf::${url}/releases/download/${pkgver}/LXGWNeoXiHeiScreenFull.ttf"
        "LICENSE.md"
        "LICENSE_CHS.md")
sha256sums=('46adc56628a84b4997539496a30e4fa000b96a347d8b2787e1504d41834e20da'
            '1483c7de02dcf8b9c54b3b1aacabf7d6bdf32d412ca6724c0292ea68e862d8cf'
            'bdadacd0751cbb3c9f040d1314ab9b855c3ebf1b540fa6dcf44524cd49819fa1')

package() {
    install -Dm 644 "${pkgname}-${pkgver}-${pkgrel}.ttf" "${pkgdir}/usr/share/fonts/TTF/${pkgname}.ttf"

    for item in LICENSE*.md
    do
        install -Dm 644 "${item}" "${pkgdir}/usr/share/licenses/${pkgname}/${item}"
    done
}
