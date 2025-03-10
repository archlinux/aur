# Maintainer: taotieren <admin@taotieren.com>

pkgbase=dingtalk-sans
pkgname=ttf-dingtalk-sans
pkgver=1.0.0
pkgrel=1
pkgdesc="钉钉进步体 dingtalk jinbuti"
url="https://www.alibabafonts.com/#/more"
depends=()
license=("LicenseRef-custom")
arch=(any)
source=(
    "${pkgbase}-${pkgver}.zip::https://fonts.alibabadesign.com/DingTalkJinBuTi.zip"
    "钉钉进步体法律声明.pdf"
)
sha256sums=('63d14f2a2a4858f9d7256bf0ad16edccb570e5555ae0c55d4140f4af6ecab8ac'
            '0de7ce1f14fa3c5f45e4c9a3eb0afbe0637e48b23ebe5e093c13901edeb31c1e')

package() {
    install -dm755 "$pkgdir/usr/share/fonts/TTF" \
        "$pkgdir/usr/share/licenses/${pkgname}"

    cd "${srcdir}/DingTalkJinBuTi"
    install -m644 DingTalkJinBuTi*/*.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -m644 ${srcdir}/钉钉进步体法律声明.pdf "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.pdf"
}
