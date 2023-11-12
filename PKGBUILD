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
# Then search for "Japanese Supplemental Fonts" and install it.
#
# On the installed Windows system fonts are usually located in
#       C:\Windows\Fonts
# and license file is
#       C:\Windows\System32\Licenses\neutral\_Default\Core\license.rtf
#
# You need all files listed in the _ttf_ms_win11_fod_japanese arrays. Place them in the
# same directory as this PKGBUILD file, then run makepkg.

pkgname=ttf-ms-win11-fod-japanese
pkgver=10.0.22631.2506
pkgrel=1
arch=(any)
url='https://learn.microsoft.com/en-us/typography/fonts/windows_11_font_list#japanese-supplemental-fonts'
license=(custom)
conflicts=(ttf-ms-win11-fod)

_ttf_ms_win11_fod_japanese=(
#####################################################################################
# Filename              # Family                Font name                   Version #
#####################################################################################
BIZ-UDGothicR.ttc       # BIZ UDGothic          BIZ UD(P)Gothic             2.00
BIZ-UDGothicB.ttc       #                       BIZ UD(P)Gothic Bold        2.00
BIZ-UDMinchoM.ttc       # BIZ-UDMincho Medium   BIZ UD(P)Mincho Medium      2.01
meiryo.ttc              # Meiryo                Meiryo (UI) (Italic)        6.50
meiryob.ttc             #                       Meiryo (UI) Bold (Italic)   6.50
msmincho.ttc            # MS Mincho             MS (P)Mincho                5.31
UDDigiKyokashoN-B.ttc   # UD Digi Kyokasho      UD Digi Kyokasho N(K,P)-B   2.00
UDDigiKyokashoN-R.ttc   #                       UD Digi Kyokasho N(K,P)-R   2.00
yuminl.ttf              # Yu Mincho             Yu Mincho Light             1.92
yumin.ttf               #                       Yu Mincho Regular           1.92
yumindb.ttf             #                       Yu Mincho Demibold          1.92
)

DLAGENTS=("file::/usr/bin/echo ${BOLD}${RED} Unable to find %u, please read the PKGBUILD ${ALL_OFF}" $DLAGENTS[@])

source=(${_ttf_ms_win11_fod_japanese[@]/#/file://}
        file://license.rtf)

sha256sums=('ddcfc7ab74c8bd08b397d4677f7604b4ea9df66a8c22917ccc8d50fa0824d4c1'
            '6a00072387ec6ec94eaaecf2520806749945a68ef9d81af891dae8223af36484'
            'f3a149f2459f61a4dc310e3f2454f068cded470ef886cfe39969c92f9a95c847'
            '457b306f719a002f1d037b2a3942f2abfa8a55d7bb109bf8950341a3129adb46'
            '7d54f5a6a4202dae7b54d5a854770cb4fecd33f8975c0996e89c6ce31f4b0808'
            '9be3424e24837ef9f07a272e4aea7779b50eeb77a0a23a95bac8e6489624deb6'
            '3749e25eb366c6d356cae6a658180f34746d7aca17e4609087c46bf27b32f2ac'
            'fb139c47122f4d1913ccf96dca6da9d7a99623c0433939c66b9a2d749366db8e'
            'a907d9169b20a52f552a7be3f6b65c5d734f41cb4257079671bdf258d72a7f11'
            '6d16c4f4f33f42f2d427857c207f732c5cd56bad43e31ad435b18758dc4758d7'
            '4aaa147e17688b9ab3937d4a90f8559e93e9326ed29690b8f14aa71515c3eff9'
            'SKIP')

_package() {
    conflicts+=(${pkgname/11/8} ${pkgname/11/10} ttf-win7-fonts${pkgname##*11})

    install -Dm644 $@ -t "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 license.rtf -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_ttf-ms-win11-fod-japanese() {
    pkgdesc='Microsoft Windows 11 Japanese Supplemental Fonts'
    _package ${_ttf_ms_win11_fod_japanese[@]}
}
