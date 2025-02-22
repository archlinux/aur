# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgbase=ttf-sarasa_ui
pkgname=(${pkgbase}{,-cl,-sc,-hc,-tc,-jp,-kr})
pkgver=1.0.28
pkgrel=1
arch=('any')
url="https://github.com/be5invis/Sarasa-Gothic/"
license=('OFL')
depends=('fontconfig')

# Deal with sources
source=("https://github.com/be5invis/Sarasa-Gothic/blob/main/LICENSE")
for name in "${pkgname[@]}"; do
    if [[ "$name" == "$pkgbase" ]]; then
        source+=("${url}releases/download/v${pkgver}/SarasaUi-TTF-${pkgver}.7z")
    elif [[ "$name" == "${pkgbase}-cl" ]]; then
        source+=("${url}releases/download/v${pkgver}/SarasaUiCL-TTF-${pkgver}.7z")
    elif [[ "$name" == "${pkgbase}-sc" ]]; then
        source+=("${url}releases/download/v${pkgver}/SarasaUiSC-TTF-${pkgver}.7z")
    elif [[ "$name" == "${pkgbase}-hc" ]]; then
        source+=("${url}releases/download/v${pkgver}/SarasaUiHC-TTF-${pkgver}.7z")
    elif [[ "$name" == "${pkgbase}-tc" ]]; then
        source+=("${url}releases/download/v${pkgver}/SarasaUiTC-TTF-${pkgver}.7z")
    elif [[ "$name" == "${pkgbase}-jp" ]]; then
        source+=("${url}releases/download/v${pkgver}/SarasaUiJ-TTF-${pkgver}.7z")
    elif [[ "$name" == "${pkgbase}-kr" ]]; then
        source+=("${url}releases/download/v${pkgver}/SarasaUiK-TTF-${pkgver}.7z")
    fi
done

sha256sums=('8001561e324f6e21401d1d29cfe6824f2f7ffbdda1946a86c14c1222782422b6'
            '8a4a96914ab16d74e9d07f196596ff3d3eb7875a0da7de31e6190a6d79139932'
            '28f8fd88e8720de9feba1aefe719cbf1ab11c1f434f0124e44c74170fec3e7b1'
            '1a2de0a868e856fc3dce417f8a3a9ea0c66b8d054cfda1571654e8711278a7ba'
            '599b18a42c61333753f3b5f20125cf7814762cb5df043c1a383c945efb884e78'
            'bba479c5e0771fc0a86affe2ecd2551c88ef7f8740566b3050d5ddeca0465230'
            '49bb6fba1b81e608969ec7560e4e9d92616fce80d76f588f932ad1df1ffcca7c'
            'e0cded6e9a87fc283f2efa65356e8bd9848dff7f5fdbef070a3fb8a390cbc383')

prepare() {
    mkdir -p "${srcdir}/usr/share/fonts/${pkgbase}"
    mkdir -p "${srcdir}/usr/share/licenses/${pkgbase}"
    cp -rf *.ttf "${srcdir}/usr/share/fonts/${pkgbase}"
}

package_ttf-sarasa_ui() {
    pkgdesc="Sarasa Gothic for UI (CJK)"
    cp -rf "${srcdir}/usr" "${pkgdir}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}"
}

package_ttf-sarasa_ui-cl() {
    pkgdesc="更纱黑体 for UI (旧汉字)"
    cp -rf "${srcdir}/usr" "${pkgdir}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}"
}

package_ttf-sarasa_ui-sc() {
    pkgdesc="更纱黑体 for UI (简体中文)"
    cp -rf "${srcdir}/usr" "${pkgdir}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}"
}

package_ttf-sarasa_ui-hc() {
    pkgdesc="更紗黑體 for UI (香港繁体中文)"
    cp -rf "${srcdir}/usr" "${pkgdir}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}"
}

package_ttf-sarasa_ui-tc() {
    pkgdesc="更紗黑體 for UI (台灣正體中文)"
    cp -rf "${srcdir}/usr" "${pkgdir}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}"
}

package_ttf-sarasa_ui-jp() {
    pkgdesc="更紗ゴシック for UI (日本語)"
    cp -rf "${srcdir}/usr" "${pkgdir}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}"
}

package_ttf-sarasa_ui-kr() {
    pkgdesc="사라사고딕 for UI (한국인)"
    cp -rf "${srcdir}/usr" "${pkgdir}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}"
}
