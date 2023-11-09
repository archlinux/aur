# Maintainer: Yutsing Kuh <yutsing@outlook.com>

pkgname=ttf-ms-win11-fod-zh_cn
pkgver=10.0.22631.2506
pkgrel=1
arch=(any)
url='https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list'
license=(custom)
conflicts=(ttf-vista-fonts)

_ttf_ms_win11_fod_zh_cn=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
simfang.ttf                                                 # FangSong
simkai.ttf                                                  # KaiTi
simhei.ttf                                                  # SimHei
Deng.ttf        Dengb.ttf                                   # DengXian
Dengl.ttf                                                   # DengXian Light
)

DLAGENTS=("file::/usr/bin/echo ${BOLD}${RED} Unable to find %u, please read the PKGBUILD ${ALL_OFF}" $DLAGENTS[@])

source=(${_ttf_ms_win11_fod_zh_cn[@]/#/file://}
        file://license.rtf)

sha256sums=('3e2d44b01c9a248a61bedae4f15c8aae501328b1f7adfe6e111a5da5aa5c5104'
            '9dd76f7ab430edd091db24c3f18e71410325c1414141aad5fe67947873ffba06'
            'aa4560dd8fe5645745fed3ffa301c3ca4d6c03cbd738145b613303961ba733b8'
            'fd46a547002d330f48855408609eb47c22a8c269fe01e3d183e7ca98397bde77'
            'be80e1246047a6489a2573c6426519c7cfe0d08c1669dd81c43bb67d39482a19'
            'a950894abb1ceb1be0d9460b26e5a6167cafc3fc3330eab7f6b21db8b96cd080'
            'SKIP')

_package() {
    conflicts+=(${pkgname/11/8} ${pkgname/11/10} ttf-win7-fonts${pkgname##*11})

    install -Dm644 $@ -t "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 license.rtf -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_ttf-ms-win11-fod-zh_cn() {
    pkgdesc='Microsoft Windows 11 Chinese (Simplified) Supplemental Fonts'
    _package ${_ttf_ms_win11_fod_zh_cn[@]}
}
