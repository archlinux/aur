# Maintainer: Yutsing Kuh <yutsing@outlook.com>

# BUILD INSTRUCTIONS:
# -------------------
#
# Please note, that usage of Microsoft fonts outside running Windows
# system is prohibited by EULA (although in certain countries EULA is invalid).
# Please consult Microsoft license before using fonts.
#
# You can acquire fonts from an installed and up-to-date Windows 11
# system with corrosponding optional fonts installed.
#
# You can go to Settings > Apps > Optional features > Add an optional feature. 
# Then search for "Simplified Chinese Supplemental Fonts" and install it.
#
# On the installed Windows system fonts are usually located in
#       C:\Windows\Fonts
# and license file is
#       C:\Windows\System32\Licenses\neutral\_Default\Core\license.rtf
#
# You need all files listed in the _ttf_ms_win11_fod_zh_cn arrays. Place them in the
# same directory as this PKGBUILD file, then run makepkg.

pkgname=ttf-ms-win11-fod-zh_cn
pkgver=10.0.22631.2506
pkgrel=3
arch=(any)
url='https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#chinese-simplified-supplemental-fonts'
license=(custom)
conflicts=(ttf-ms-win10-fod-zh_cn ttf-ms-win11-fod)

_ttf_ms_win11_fod_zh_cn=(
#########################################################
# Filename      # Family        Font name       Version #
#########################################################
Dengl.ttf       # DengXian      DengXian Light  1.18
Deng.ttf        #               DengXian        1.18
Dengb.ttf       #               DengXian Bold   1.18
simfang.ttf     # FangSong      FangSong        5.01
simkai.ttf      # KaiTi         KaiTi           5.01
simhei.ttf      # SimHei        SimHei          5.03
)

DLAGENTS=("file::/usr/bin/echo ${BOLD}${RED} Unable to find %u, please read the PKGBUILD ${ALL_OFF}" $DLAGENTS[@])

source=(${_ttf_ms_win11_fod_zh_cn[@]/#/file://}
        file://license.rtf)

sha256sums=('a950894abb1ceb1be0d9460b26e5a6167cafc3fc3330eab7f6b21db8b96cd080'
            'fd46a547002d330f48855408609eb47c22a8c269fe01e3d183e7ca98397bde77'
            'be80e1246047a6489a2573c6426519c7cfe0d08c1669dd81c43bb67d39482a19'
            '3e2d44b01c9a248a61bedae4f15c8aae501328b1f7adfe6e111a5da5aa5c5104'
            '9dd76f7ab430edd091db24c3f18e71410325c1414141aad5fe67947873ffba06'
            'aa4560dd8fe5645745fed3ffa301c3ca4d6c03cbd738145b613303961ba733b8'
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
