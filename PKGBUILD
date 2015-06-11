# Maintainer: reflexing <reflexing@reflexing.ru>
# Package is maintained on GitHub: https://github.com/reflexing/ttf-ms-win8
# ArchWiki page:  https://wiki.archlinux.org/index.php/Ttf-ms-win8
#
# BUILD INSTRUCTIONS:
# ----------------------
# This package is based on 'ttf-win7-fonts' package with fixes,
# suggested by AUR's 'severach' user in comments.
#
# It is intended as a more up-to-date replacement for the AUR's
# 'ttf-ms-fonts', 'ttf-vista-fonts' and 'ttf-win7-fonts' packages.
# It provides newer versions of the fonts in these packages, but due
# to license issues cannot automatically download the fonts.
#
# Please note, that usage of Microsoft fonts outside running Windows
# system is prohibited by EULA (although in certain countries EULA is invalid).
# Please consult Microsoft license before using fonts.
#
# You can acquire fonts either from an installed Windows 8.1 RTM system
# or install medium. Any edition of Windows 8.1 RTM build 6.3.9600.17050 will work.
#
# On the installed Windows 8.1 system fonts are usually located in
#       C:\Windows\Fonts
# and license file is
#       C:\Windows\System32\license.rtf
#
# How to acquire fonts from Windows 8.1 RTM install medium:
#
#    You can freely download the Windows 8.1 Enterprise 90-day evaluation from:
#
#       http://technet.microsoft.com/en-US/evalcenter/hh699156.aspx
#
#    Fonts are located in 'sources/install.wim' file on the ISO, which
#    is a 'Windows Imaging Format' (WIM) archive.
#
#    You can extract WIM using wimextract ('wimlib' package from AUR).
#
#    Put the following script together with previously extracted
#   'install.wim' and execute:
#
#       wimextract install.wim 1 /Windows/{Fonts/"*".{ttf,ttc},System32/license.rtf} --dest-dir fonts
#
#    Fonts and license will be located in the 'fonts' dir.
#
# Fonts are best viewed with Infinality freetype2 packages:
#
#    https://wiki.archlinux.org/index.php/Font_Configuration#Infinality
#
# Infinality offers great font rendering and customization.
#
# You need the files listed in the source=() array. Place them in the same
# directory as this PKGBUILD file, then run makepkg.

pkgbase=ttf-ms-win8
pkgname=($pkgbase $pkgbase-arabic $pkgbase-hebrew
    $pkgbase-sea $pkgbase-indic $pkgbase-japanese $pkgbase-korean
    $pkgbase-zh_cn $pkgbase-zh_tw $pkgbase-thai $pkgbase-other)

pkgver=6.3.9600.17238
pkgrel=1
pkgdesc='Microsoft Windows 8.1 TrueType fonts'
arch=('any')
url='http://www.microsoft.com/typography/fonts/product.aspx?PID=164'
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-mkfontscale' 'xorg-mkfontdir')
makedepends=('fontforge')
provides=('ttf-font' 'ttf-ms-fonts' 'ttf-tahoma' 'ttf-vista-fonts' 'ttf-win7-fonts')
conflicts=('ttf-ms-fonts' 'ttf-tahoma' 'ttf-vista-fonts' 'ttf-win7-fonts')
install="$pkgbase.install"
PKGEXT='.pkg.tar' # because XZ compression is awfully slow

_ttf_ms_win8=(
#########################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name               Version  Comment #
#########################################################################################################
arial.ttf      arialbd.ttf    ariali.ttf     arialbi.ttf    # Arial                       6.87
ariblk.ttf                                                  # Arial Black                 5.21
comic.ttf      comicbd.ttf    comici.ttf     comicz.ttf     # Comic Sans MS               5.11
cour.ttf       courbd.ttf     couri.ttf      courbi.ttf     # Courier New                 6.85
framd.ttf                                                   # Franklin Gothic Medium      5.01
                              framdit.ttf                   #   Italic                    5.00
Gabriola.ttf                                                # Gabriola                    5.92
georgia.ttf    georgiab.ttf   georgiai.ttf   georgiaz.ttf   # Georgia                     5.51
impact.ttf                                                  # Impact                      5.10
lucon.ttf                                                   # Lucida Console              5.00
l_10646.ttf                                                 # Lucida Sans Unicode         5.00
marlett.ttf                                                 # Marlett                     5.00 Symbol
micross.ttf                                                 # Microsoft Sans Serif        6.02
pala.ttf       palab.ttf      palai.ttf      palabi.ttf     # Palatino Linotype           5.02
segoepr.ttf    segoeprb.ttf                                 # Segoe Print                 5.02
segoesc.ttf    segoescb.ttf                                 # Segoe Script                5.00
segoeui.ttf    segoeuib.ttf   segoeuii.ttf   segoeuiz.ttf   # Segoe UI                    5.35
seguibl.ttf                   seguibli.ttf                  # Segoe UI Black              2.00
seguiemj.ttf                                                # Segoe UI Emoji              1.02
segoeuil.ttf                  seguili.ttf                   # Segoe UI Light              5.35
seguisb.ttf                   seguisbi.ttf                  # Segoe UI Semibold           5.35
segoeuisl.ttf                 seguisli.ttf                  # Segoe UI Semilight          5.35
seguisym.ttf                                                # Segoe UI Symbol             6.09
Sitka.ttc      SitkaB.ttc     SitkaI.ttc     SitkaZ.ttc     # Sitka Banner                1.10 Latin, Greek and Cyrillic
#Sitka.ttc     #SitkaB.ttc    #SitkaI.ttc    #SitkaZ.ttc    # Sitka Display               1.10
#Sitka.ttc     #SitkaB.ttc    #SitkaI.ttc    #SitkaZ.ttc    # Sitka Heading               1.10
#Sitka.ttc     #SitkaB.ttc    #SitkaI.ttc    #SitkaZ.ttc    # Sitka Small                 1.10
#Sitka.ttc     #SitkaB.ttc    #SitkaI.ttc    #SitkaZ.ttc    # Sitka Subheading            1.10
#Sitka.ttc     #SitkaB.ttc    #SitkaI.ttc    #SitkaZ.ttc    # Sitka Text                  1.10
sylfaen.ttf                                                 # Sylfaen                     5.03
symbol.ttf                                                  # Symbol                      5.00
tahoma.ttf     tahomabd.ttf                                 # Tahoma                      6.03
times.ttf      timesbd.ttf    timesi.ttf     timesbi.ttf    # Times New Roman             6.87
trebuc.ttf     trebucbd.ttf   trebucit.ttf   trebucbi.ttf   # Trebuchet MS                5.12
verdana.ttf                                                 # Verdana                     5.31
               verdanab.ttf                                 #   Bold                      5.30
                              verdanai.ttf                  #   Italic                    5.30
                                             verdanaz.ttf   #   Bold Italic               5.30
webdings.ttf                                                # Webdings                    5.00 Symbol
wingding.ttf                                                # Wingdings                   5.00 Symbol
)

_vista=(
#########################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name               Version  Comment #
#########################################################################################################
calibri.ttf    calibrib.ttf   calibrii.ttf   calibriz.ttf   # Calibri                     5.87
calibril.ttf                  calibrili.ttf                 # Calibri Light               2.12
cambria.ttc    cambriab.ttf   cambriai.ttf   cambriaz.ttf   # Cambria                     6.82
#cambria.ttc                                                # Cambria Math                6.82
Candara.ttf    Candarab.ttf   Candarai.ttf   Candaraz.ttf   # Candara                     5.61
consola.ttf    consolab.ttf   consolai.ttf   consolaz.ttf   # Consolas                    5.34
constan.ttf                                                 # Constantia                  5.91
               constanb.ttf                                 #   Bold                      5.90
                              constani.ttf                  #   Italic                    5.90
                                             constanz.ttf   #   Bold Italic               5.90
corbel.ttf     corbelb.ttf    corbeli.ttf    corbelz.ttf    # Corbel                      5.61
)
_ttf_ms_win8=("${_ttf_ms_win8[@]}" "${_vista[@]}")

_sea=(
#########################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name               Version  Comment #
#########################################################################################################
daunpenh.ttf                                                # DaunPenh                    5.00 Khmer
dokchamp.ttf                                                # DokChampa                   5.00 Lao
javatext.ttf                                                # Javanese Text               1.00 Javanese
KhmerUI.ttf    KhmerUIb.ttf                                 # Khmer UI                    5.02 Khmer
LaoUI.ttf      LaoUIb.ttf                                   # Lao UI                      5.01 Lao
himalaya.ttf                                                # Microsoft Himalaya          5.10 Tibetan
ntailu.ttf     ntailub.ttf                                  # Microsoft New Tai Lue       5.96 Tai Lue
phagspa.ttf    phagspab.ttf                                 # Microsoft PhagsPa           5.97 Phags-pa
taile.ttf      taileb.ttf                                   # Microsoft Tai Le            5.96 Tai Le
msuighur.ttf   msuighub.ttf                                 # Microsoft Uighur            6.00 Uighur
msyi.ttf                                                    # Microsoft Yi Baiti          5.97 Yi Script
moolbor.ttf                                                 # MoolBoran                   5.00 Khmer
monbaiti.ttf                                                # Mongolian Baiti             5.41 Mongolian
mmrtext.ttf    mmrtextb.ttf                                 # Myanmar Text                1.10 Myanmar
Nirmala.ttf    NirmalaB.ttf                                 # Nirmala UI                  1.10 South Asian scripts (Bangla, Devanagari, Gujarati, Malayalam, Odia, Telugu)
NirmalaS.ttf                                                # Nirmala UI Semilight        1.00
)

_indic=(
#########################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name               Version  Comment #
#########################################################################################################
aparaj.ttf     aparajb.ttf    aparaji.ttf    aparajbi.ttf   # Aparajita                   6.00 Hindi
gautami.ttf    gautamib.ttf                                 # Gautami                     6.00 Indic script — Telugu
kalinga.ttf    kalingab.ttf                                 # Kalinga                     6.00 Oriya
kartika.ttf    kartikab.ttf                                 # Kartika                     6.00 Indic script — Malayalam
kokila.ttf     kokilab.ttf    kokilai.ttf    kokilabi.ttf   # Kokila                      6.00 Hindi
latha.ttf      lathab.ttf                                   # Latha                       6.00 Indic script — Tamil
mangal.ttf     mangalb.ttf                                  # Mangal                      6.00 Indic script — Devanagari
raavi.ttf      raavib.ttf                                   # Raavi                       6.00 Indic script — Gurmukhi
shruti.ttf     shrutib.ttf                                  # Shruti                      6.00 Indic script — Gujarati
tunga.ttf      tungab.ttf                                   # Tunga                       6.00 Indic script — Kannada
utsaah.ttf     utsaahb.ttf    utsaahi.ttf    utsaahbi.ttf   # Utsaah                      6.00 Hindi
Vani.ttf       Vanib.ttf                                    # Vani                        6.81 Indic script — Telugu
vrinda.ttf     vrindab.ttf                                  # Vrinda                      6.81 Indic script — Bengali
vijaya.ttf     vijayab.ttf                                  # Vijaya                      6.81 Tamil
Shonar.ttf     Shonarb.ttf                                  # Shonar Bangla               6.81 Bengali
iskpota.ttf    iskpotab.ttf                                 # Iskoola Pota                6.00 Sinhala
)

_zh_cn=( # Chinese (Simplified)
#########################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name               Version  Comment #
#########################################################################################################
simkai.ttf                                                  # KaiTi                       5.01 Simplified Chinese
simsun.ttc                                                  # NSimSun                     5.04 Simplified Chinese
simhei.ttf                                                  # SimHei                      5.03 Simplified Chinese font features plain strokes similar to sans serif designs
#simsun.ttc                                                 # SimSun                      5.04 Simplified Chinese font features mincho (serif) stroke style
simsunb.ttf                                                 # SimSun-ExtB                 5.01
simfang.ttf                                                 # FangSong                    5.01 Simplified Chinese
msyh.ttc       msyhbd.ttc                                   # Microsoft YaHei             6.10 Simplified Chinese
msyhl.ttc                                                   # Microsoft YaHei Light       1.01
#msyh.ttc      msyhbd.ttc                                   # Microsoft YaHei UI          6.10 Simplified Chinese
#msyhl.ttc                                                  # Microsoft YaHei UI Light    1.01
)

_zh_tw=( # Chinese (Traditional)
#########################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name               Version  Comment #
#########################################################################################################
kaiu.ttf                                                    # DFKai-SB                    5.00 Serif style with Traditional Chinese support. DFKai-SB has graceful strokes
msjh.ttc       msjhbd.ttc                                   # Microsoft JhengHei          6.10 Chinese: Traditional chars — Taiwan and Hong Kong
msjhl.ttc                                                   # Microsoft JhengHei Light    1.00
#msjh.ttc      msjhbd.ttc                                   # Microsoft JhengHei UI       6.10
#msjhl.ttc                                                  # Microsoft JhengHei UI Light 1.00
mingliu.ttc                                                 # MingLiU                     7.01 Traditional Chinese font in a mincho (serif) stroke style
#mingliu.ttc                                                # MingLiU_HKSCS               7.01
mingliub.ttc                                                # MingLiU_HKSCS-ExtB          7.01
#mingliub.ttc                                               # MingLiU-ExtB                7.01
#mingliu.ttc                                                # PMingLiU                    7.01 Traditional Chinese font that features a mincho (serif) stroke style with proportional Latin characters
#mingliub.ttc                                               # PMingLiU-ExtB               7.01
)

_japanese=(
#########################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name               Version  Comment #
#########################################################################################################
meiryo.ttc     meiryob.ttc    #meiryo.ttc    meiryob.ttc    # Meiryo                      6.12 Japanese and Roman
#meiryo.ttc    meiryob.ttc    meiryo.ttc     meiryob.ttc    # Meiryo UI                   6.12
msgothic.ttc                                                # MS Gothic                   5.10 Japanese font features plain strokes similar to sans serif designs
msmincho.ttc                                                # MS Mincho                   5.10 Japanese font that features serifs at the end of its strokes
#msgothic.ttc                                               # MS PGothic                  5.10 Japanese font with proportional latin in the gothic (sans serif) style
#msmincho.ttc                                               # MS PMincho                  5.10 Japanese font with proportional latin in the mincho (serif) style
#msgothic.ttc                                               # MS UI Gothic                5.10 The default glyph shapes of this font are based on JIS2004. This font also provides access to a set of JIS90 legacy glyphs via jp90' OpenType layout table.
yugothic.ttf   yugothib.ttf                                 # Yu Gothic                   1.55
yugothil.ttf                                                # Yu Gothic Light             1.55
yumindb.ttf                                                 # Yu Mincho Demibold          1.55
yuminl.ttf                                                  # Yu Mincho Light             1.55
yumin.ttf                                                   # Yu Mincho Regular           1.55
)

_korean=(
#########################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name               Version  Comment #
#########################################################################################################
batang.ttc                                                  # Batang                      5.00 Korean font that features a mincho (serif) stroke style
#batang.ttc                                                 # BatangChe                   5.00
gulim.ttc                                                   # Dotum                       5.00 Korean
#gulim.ttc                                                  # DotumChe                    5.00
#gulim.ttc                                                  # Gulim                       5.01 Korean
#gulim.ttc                                                  # GulimChe                    5.00 Korean
#batang.ttc                                                 # Gungsuh                     5.00 Korean
#batang.ttc                                                 # GungsuhChe                  5.00 Korean
malgun.ttf     malgunbd.ttf                                 # Malgun Gothic               6.50 Korean
)

_arabic=(
#########################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name               Version  Comment #
#########################################################################################################
aldhabi.ttf                                                 # Aldhabi                     1.00 Arabic, Latin
andlso.ttf                                                  # Andalus                     6.00 Arabic, Latin
arabtype.ttf                                                # Arabic Typesetting          6.00 Arabic, Latin
majalla.ttf    majallab.ttf                                 # Sakkal Majalla              6.81 Arabic font based on Naskh calligraphy
simpo.ttf      simpbdo.ttf                                  # Simplified Arabic           6.00 Arabic
simpfxo.ttf                                                 # Simplified Arabic Fixed     5.92
trado.ttf      tradbdo.ttf                                  # Traditional Arabic          6.00 Arabic
UrdType.ttf    UrdTypeb.ttf                                 # Urdu Typesetting            6.00 Arabic
)

_hebrew=(
#########################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name               Version  Comment #
#########################################################################################################
               ahronbd.ttf                                  # Aharoni Bold                5.10 Hebrew, Latin
david.ttf      davidbd.ttf                                  # David                       6.00 Hebrew
frank.ttf                                                   # FrankRuehl                  5.10 Hebrew
gisha.ttf      gishabd.ttf                                  # Gisha                       5.01 Hebrew
lvnm.ttf       lvnmbd.ttf                                   # Levenim MT                  6.00 Hebrew
mriam.ttf                                                   # Miriam                      5.10 Hebrew
mriamc.ttf                                                  # Miriam Fixed                5.10
nrkis.ttf                                                   # Narkisim                    5.10 Hebrew
rod.ttf                                                     # Rod                         5.10 Hebrew
)

_thai=(
#########################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name               Version  Comment #
#########################################################################################################
angsa.ttf      angsab.ttf     angsai.ttf     angsaz.ttf     # Angsana New                 5.01 Thai, Latin
angsau.ttf     angsaub.ttf    angsaui.ttf    angsauz.ttf    # AngsanaUPC                  5.01 Thai, Latin
browa.ttf      browab.ttf     browai.ttf     browaz.ttf     # Browallia New               5.01 Thai
browau.ttf     browaub.ttf    browaui.ttf    browauz.ttf    # BrowalliaUPC                5.01 Thai
cordia.ttf     cordiab.ttf    cordiai.ttf    cordiaz.ttf    # Cordia New                  5.01 Thai
cordiau.ttf    cordiaub.ttf   cordiaui.ttf   cordiauz.ttf   # CordiaUPC                   5.01
upcdl.ttf      upcdb.ttf      upcdi.ttf      upcdbi.ttf     # DilleniaUPC                 5.01 Thai
upcel.ttf      upceb.ttf      upcei.ttf      upcebi.ttf     # EucrosiaUPC                 5.01 Thai
upcfl.ttf      upcfb.ttf      upcfi.ttf      upcfbi.ttf     # FreesiaUPC                  5.02 Thai
upcil.ttf      upcib.ttf      upcii.ttf      upcibi.ttf     # IrisUPC                     5.02 Thai
upcjl.ttf      upcjb.ttf      upcji.ttf      upcjbi.ttf     # JasmineUPC                  5.01 Thai
upckl.ttf      upckb.ttf      upcki.ttf      upckbi.ttf     # KodchiangUPC                5.01 Thai
leelawad.ttf   leelawdb.ttf                                 # Leelawadee                  5.05 Thai
LeelawUI.ttf   LeelaUIb.ttf                                 # Leelawadee UI               1.00 Khmer, Lao, Thai, Buginese
LeelUIsl.ttf                                                # Leelawadee UI Semilight     1.00
upcll.ttf      upclb.ttf      upcli.ttf      upclbi.ttf     # LilyUPC                     5.01 Thai
)

_other=(
#########################################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name               Version  Comment #
#########################################################################################################
ebrima.ttf     ebrimabd.ttf                                 # Ebrima                      5.08 African
estre.ttf                                                   # Estangelo Edessa            6.00 Syriac
euphemia.ttf                                                # Euphemia                    5.05 Unified Canadian Syllabics
gadugi.ttf     gadugib.ttf                                  # Gadugi                      1.06 Unified Canadian Aboriginal Syllabics
nyala.ttf                                                   # Nyala                       5.01 Ethiopic, Latin
plantc.ttf                                                  # Plantagenet Cherokee        5.07 Cherokee
mvboli.ttf                                                  # MV Boli                     6.00 Thaana, Maldivian
)

source=("${_ttf_ms_win8[@]}" "${_arabic[@]}" "${_hebrew[@]}"
    "${_sea[@]}" "${_korean[@]}" "${_japanese[@]}" "${_zh_cn[@]}"
    "${_zh_tw[@]}" "${_indic[@]}" "${_thai[@]}" "${_other[@]}"
    20-ttf-ms-win8-japanese.conf
    20-ttf-ms-win8-korean.conf
    20-ttf-ms-win8-zh_cn.conf
    20-ttf-ms-win8-zh_tw.conf
    license.rtf)

function _extract_ttcs {
    # Tabs are essential!
    # Important: use real tab characters!
    ff_script=$(cat <<-'SETVAR'
		i = 1
		while (i < $argc)
			theFontNames = FontsInFile($argv[i])
			cnt = SizeOf(theFontNames)
			j = 0
			while (j < cnt)
				thefontname = theFontNames[j]
				thisPath = $argv[i] + "(" + thefontname + ")"
				Open(thisPath, 1)
				Generate(thefontname + ".ttf", "ttf")
				Print(thefontname + ".ttf")
				Close()
				j++
			endloop
		i = i+1
		endloop
	SETVAR
	)

    fontforge -lang=ff -c "$ff_script" $*
    rm $*
}

function _remove_from_fonts_array {
    fonts_len=${#fonts[@]};

    for (( i = 0, j = $#; (i < $fonts_len) && (j > 0); i++)); do
        for remove in "$@"; do
            if [ "${fonts[$i]}" = "$remove" ]; then
                unset fonts[$i]
                (( j-- ))
                break
            fi
        done
    done
}

function _package {
    # Array name can't have underscores… thus this check
    if [ "$1" = "$pkgbase" ]; then
        fonts_array_name=_${pkgbase//-/_}[@];
    else
        fonts_array_name=_${1#${pkgbase}-}[@];
        provides=($1)
        conflicts=()
    fi

    fonts=("${!fonts_array_name}")

    declare -a ttcs_to_extract

    case "$1" in
        $pkgbase) ttcs_to_extract=(cambria.ttc Sitka*.ttc);;
        $pkgbase-arabic) pkgdesc="Microsoft Windows 8.1 Arabic TrueType fonts";;
        $pkgbase-hebrew) pkgdesc="Microsoft Windows 8.1 Hebrew TrueType fonts";;
        $pkgbase-sea) pkgdesc="Microsoft Windows 8.1 Southeast Asian TrueType fonts";;
        $pkgbase-indic) pkgdesc="Microsoft Windows 8.1 Indic TrueType fonts";;
        $pkgbase-japanese)
            pkgdesc="Microsoft Windows 8.1 Japanese TrueType fonts"
            ttcs_to_extract=(meiryo*.ttc msgothic.ttc msmincho.ttc)
        ;;
        $pkgbase-korean)
            pkgdesc="Microsoft Windows 8.1 Korean TrueType fonts"
            ttcs_to_extract=(batang.ttc gulim.ttc)
        ;;
        $pkgbase-zh_cn)
            pkgdesc="Microsoft Windows 8.1 Simplified Chinese TrueType fonts"
            ttcs_to_extract=(msyh*.ttc simsun.ttc)
        ;;
        $pkgbase-zh_tw)
            pkgdesc="Microsoft Windows 8.1 Traditional Chinese TrueType fonts"
            ttcs_to_extract=(mingliu*.ttc msjh*.ttc)
        ;;
        $pkgbase-thai) pkgdesc="Microsoft Windows 8.1 Thai TrueType fonts";;
        $pkgbase-other) pkgdesc="Microsoft Windows 8.1 other TrueType fonts";;
    esac

    if (( ${#ttcs_to_extract[@]} > 0 )); then
        readarray -t extracted_ttfs < <(_extract_ttcs ${ttcs_to_extract[@]})
        _remove_from_fonts_array ${ttcs_to_extract[@]}
        fonts+=("${extracted_ttfs[@]}")
    fi

    # Prepare destination directory
    install -dm755 "$pkgdir/usr/share/fonts/TTF"

    # Install fonts
    for font in "${fonts[@]}"; do
        install -m644 "$font" "$pkgdir/usr/share/fonts/TTF"
    done

    # Install available fontconfig fix
    if [[ -e 20-$1.conf ]]; then
        backup=("etc/fonts/conf.avail/20-$1.conf")
        install -Dm644 "20-$1.conf" -t "$pkgdir/etc/fonts/conf.avail"
    fi

    # Install license
    install -Dm644 license.rtf -t "$pkgdir/usr/share/licenses/$pkgname"
}

for package_name in ${pkgname[@]}; do
    eval "function package_$package_name() { _package $package_name; }"
done

md5sums=('3c9390eb37dd4ab8c670ecd71feb7f71'
         '33659c3ee1590a4826de9a70b48fb502'
         '0cac7d1a894ee4dc31c0ab41964ae9f7'
         'e9e3cdb926753ee01b398d1820d7499c'
         '1f704893145d21747186116f85b2c062'
         'cfbe2858223b5d6f0fead9583b07f3fd'
         '6548235ee4b7ca0b8a7d464546fa5ca5'
         '1d32338d1c97538b798ca8563f70d39a'
         '8f87bcf26c27af0830c28c30a35bb211'
         'b6039fa097882e218ee2578c0d0aac31'
         '3ffc90f7396903a40cc66bc157bf21ee'
         'c13928bee4ee33e7b3662bd63d24fbe4'
         'c66c228e2922d8f400b8de2fd2be00ea'
         '45a9841a7f5ba7a780f0a804553cfce7'
         'e2ae623d5f37a67aaf66673fc5be6ea7'
         '9f6c62f1f041ca9f3d69ac76684314d0'
         'de6243382a94fdc4813e4cbd4ff7d919'
         'd9e4d24448593640c2cc90e68c3317f6'
         'ca432c56ca6ff81a0a1476846dffeac9'
         '9d82f2cd4cf4ec35d72f70e4e025072b'
         '9d0962f073f288d799831d4688b1e917'
         'ed07815509f9c255b6e0f66c7910eb97'
         'bcccd674c3fe808a4b01b8914c6898d5'
         '5f10daf510c3cb9ccfa737cade9c5a90'
         '30aaab7543fd6fb214293690e338ab3d'
         'ca0f4f6cbe091b7e72e46f58c8fa1768'
         'd872799430da10fc39041a01ce9da39a'
         'c71db8e1b4141ea96f3bafadf776601d'
         'fc67dd3a4e36a1c4129f5a87c3964ad0'
         'c455d94eee43dc4ceeb83c0c0fd0d4c8'
         '4ed8298204138b08c1e73d2d9a6cba9a'
         '5c452fb7a0f5751f4e94e9d84eb01154'
         'acd33fd0ea8c011932aa4f3ac713663c'
         'b9e9836ef247552bfd77832dfac2d8d8'
         'b09bfa24069fd1b933f3c4ae2ae014da'
         '0a65acd76a24f44d600f6e6b85be7f92'
         'e6b433398799f93baf8ab18b71230098'
         'a7e432d8873d584fe29fa20d46b634e8'
         '4e5950a47f09b85e2a0ffffb21e0a762'
         '2b01c6caabbe95afc92aa63b9bf100f3'
         '4d216b5521fcddd59102febd16593f2b'
         'b537ed7523d0e2e28bd80b217c22557b'
         'e6df1498e3403d6dad36893d1ebb2793'
         '70d1fbe40d04fb35cf61af752ff38616'
         '220ed779ceb7548cffc955abe8e78115'
         '96107d9f3904eb7c0fdcba852dd4db87'
         '523ab078aac307d0e576a80bc155d32e'
         '164ff6ff28c62089186dc097ae48d2b8'
         '5dbde7b0804b8c3c996ec4fd06d93885'
         '2e4c9266278a6eccf131b6683ff3ca75'
         '4bd7ebd58fbcd774ffa37b9320275baa'
         '4c8aa8124876afd5474fb94d53785536'
         '9629034e291841f941497d4a365c01f7'
         '37f3ea3bd935bcd0e390b7d36fce4422'
         '41f6e2e95c82d92975d7dfe0127e2071'
         '86d0941b7d16e6d2d99250a9f451c42c'
         '43a1861fb747438005fa1615b70798a4'
         'ab762c124dc183bc6dad8fd0eceab860'
         '0079dcaa1e0c6fb63a748ed0ae9decc9'
         'd866b4f2ff8ff64c258d78f5069a195d'
         '48ab12b53456a65c1460d400c677cb7c'
         'dc9b6130661d97afb20c57871a28ec5b'
         '6148338d755c7727f9f0fe62fdd0a4be'
         'ba34b303291e36596759eb46ad9c51f2'
         'ddbe52e2cfdcc2b8c9c4ab8de872a325'
         '85e38a5e32b54e416c4b437b59501d31'
         'b8d06d04e2d848ebcdd428cd8125f211'
         '40a90d72da61d7c609c9a4c4bb37c710'
         '68c74934563bf4afa50793c67bd19b24'
         'ba862abb7c58a35f395609aa882ac005'
         'd905ade8231b368ca3cfc1eb2dfc209c'
         'c04301d5963a8bb6d92bcf848b90ce2e'
         'ba72d949f382dc5afd9cfcaab83b4764'
         '6be085da04bf18866e710f1a9f6f0815'
         '751cfe52d49175e660208744a1c49f63'
         'ca04a867881cb5bff94d44ccbaa2455c'
         'ddc3787740e46a44fbbc2ca21d247169'
         '1529f716345efd59d2d0ccf7f74d6e4d'
         '403c3c55161a93bed918f4788d83f943'
         '8daa0f2304ee100fe3888d5b7307e64f'
         '702d8433e65d57e2612d01f1db078242'
         'f4ab481e2d12c0321cc1907192da90f0'
         '44b0a478d3b790698f52828bbf6b2b68'
         'ac2b52f4c79b230f1b9b6af76df373f1'
         'ee5d3c7d6abaff58a7c13b897708f7de'
         'bd833963e7f551f6c7928c1886b8c2da'
         '88308946cf61c7486ce17790be5393a3'
         'd145e0da42db9c9a2277fed0ad3bd723'
         'b411b0999020c9c25b8151e359197150'
         '68948ea9bc8b232cc5664e2aab39c80c'
         '1ad619060822679a34db35a498f98ecc'
         '51ee907427c788c3ab4442e73286d641'
         'c87f06ae40c78321844f2eac8b51737f'
         'e6c0e179deb07f3fc7a6d0d7a2a77247'
         '6c5e3e581b522258be508b4d8868025d'
         'd44e7660a481c4301fef58738e6b0e09'
         'f4ea18dbd4384a85992e2fba5a9a2755'
         '6833fd2ecb2c52169cae26a42b7203d0'
         'b44376c9075d1504325bc3ec90dbb6f4'
         '913cc34104f91f98bec42574c473c09c'
         '3aa23555dfcbe82a90885edd2a0d5080'
         'f4b07ffa9f31914ce26e249ad335e218'
         'af53b53dcea967bd95b045bc5f7aaa86'
         '5fdb768036f48f4d90757979d408c8a4'
         'a1f198485a5d9c7e5c179400cec0bcdb'
         'f12b89a259e0127daaed5068b08cea0d'
         '1f8883a41e786677a14066f72deaa43e'
         '26d06974844e151d41d653d06ead6eb3'
         '2b03849be7b74fff32bb7694ae4680dd'
         '064398293fbaae15e5ade02a1c2cdf53'
         '239f82bf0cfb3410e88880111e9b3a6e'
         '405b972928c4b2e19d54034f6b02d709'
         'f67ffb5a32e345123b6e22aff1544a47'
         '3c35be3152cc389a17eb8bb5678be375'
         'cd605f29105ecf29f7b2391361afa7ce'
         'afbeedfc9acc9bbe9cfd599a22b308d0'
         'fac95353a86abbed9eace647753649aa'
         '1acc5a25e322baac7580349f55167ec3'
         '62cde82faa7e2feca7f77774e9debbf7'
         '5a68a4e0bd54f918326fdcf96028e3ff'
         '119688cc24c7a1c78a469b0ed365edd7'
         'd50d18fb35676d937e58d98b184a71bd'
         'c9ebe11cbee5b011666eeffa9a549f6c'
         '1ca7356ca863431f36aff1647a76b918'
         'b01bdacdd24858fac6bbe36c69eb281b'
         'b4ece38d8537d1a15ac9d133353d2631'
         '0243e1b2756076047468049f20df479e'
         '95ecc0565801dd1bf141999d2c6a773b'
         '3350b74ee179d80520af3ebee4349ae7'
         'b69d80cc66dd8caea9341129fd527bad'
         '1dc00136983c88081a23beb6371e1b04'
         '41b542e60d48fe9ce55f52cca935cf8f'
         '1ac7418067be30f0bf726abff6487f8c'
         'b9563a8d78c5662ebdd0091af73a1881'
         '88dd96d6c1979c106e70c4347e4e9657'
         'f4fde5baf005269c9ab6edb4fc24025a'
         'dbb5d50716af7c45dd357a6a585d7a9e'
         'fd05cde16e149f89102560c1d2634ffc'
         '978de217332af3770ca38a5810078f03'
         '57b8785d72a033686770ed4462539518'
         '683719689ce3635687532089a45d510f'
         '2790b726c7bf4c97c59a00ad7f477d01'
         '81e80101d01e14414591e4b899099483'
         '982509f4c25a0ac0f4e368e222e894fe'
         'fde85c81a1b925fac046e0c916f04847'
         'd2e686b918b3707d1bd1a8bae5be8c6d'
         '275160d2e264cb4ca3aee67208f45597'
         '416fd5586df11a096a8dc42d90bbb59c'
         '1ea3d505273e849eb6177d56ead0fea7'
         '79e95205706c61bfe684c3a00ba5f870'
         '0c5496ca205ffe62b69da242c6cd1170'
         'e587ff1ab1a23fdeee65c351de5ffde4'
         '1050d2613fe00e50ef8db4206abea536'
         '8c0c4b4cd2490679c500e7964cbe3446'
         '3886b750fc0bdd77d9904463b2ff2f31'
         'fd003f16a9c2a89271eb780bf789f073'
         '785253776017c38737d1f9f3d8f8df9b'
         'bbfaa12767e15e3f94ea902402527b17'
         '0bfc61b8c2c21ee1ffa416e0982f96c0'
         'e54ea8e978c319647285100ebcabb037'
         '127efc862e34db7d79b5c9c68ffba19c'
         '2ecbfe1d9bfc191c6f15c0ccc23cbd43'
         'cec7016379845916302d3cf8660e27b5'
         '3c504f1a05f0330b6352517229318dd5'
         'fd474ff7440543ade9b2b8fe9982a51c'
         '831990523227b528157bb99b63f6b45b'
         'ce5fed6a7e397f3d4c92bcd6b60603b5'
         '2fa65bfad147467bbf1385b05e5a5c4c'
         '22b430344f3794e6c7f6b8e700fb25b4'
         '0f833110f12084efc38a3fce20c536b1'
         'a3272cf4d7504b5149a7f1df5701f21a'
         '2d54759d91a5d486c978a1b91d3bfde5'
         '65d8a5aa466663fcf6efe14fc61c13b1'
         '48121ad38e651398285eb4dcf6b9eaaa'
         '50f2b4170f7b8a72cbc772cb2e320ace'
         '500217bc47ef109d09f150e2073d724a'
         '37f912ee78901fa08d2b2fa9d7dbb2f8'
         'a507ad0e94cd89810896f76a352b9df6'
         '95c6a3a3407faf4a1ed4fa2e9a195004'
         '5099b82ed5b9dde6814754bde7d0c504'
         'bbbd6de916640591eccfd8a4e912f992'
         '49d646c3ef4b1ed896e49ccf5325b800'
         '68befc880d754b0cfe9c5bb209ed3ebe'
         '0f94a65c93ff58c2f324f0594f55d782'
         '4e4d7ff5efe276f1757c0867572fdb33'
         '4733d247a7a07f496e3b94b392f0c203'
         'e12ad0b1dd20f58d32476a246903e253'
         'bd457d8526526e71b33c3279a3788172'
         '791776f21df91d5606ff49663745de3e'
         'c9fb106baebb8adefdc9d370a96d3d6b'
         '96ef6dcc96e593c1a113c832c9a8b82b'
         'bd62ec46ec3bd0e32b02a1fcb81bf043'
         '24a692e78c11789c4c6f768ff6b5b3d3'
         '99c9e9acd0a9f1d5a4d436d6d4099aa3'
         'b2aec25686fc087af06384a7b3ab74a9'
         '7f046e683696686a23d551b1c69d2303'
         '68a1af08166c78ae1fcbaf971886c283'
         'c6eb582ab913ee2842bd3b15e23d7d7c'
         '681a9f4132d242d3fb8f0048df0a76f6'
         'b2054e959316918390077274332377d5'
         'debf4c986b4b5528a88fb7a72336b3e0'
         '15049f6076f90570cd012dd226bb6d26'
         '74749bd51b54a01a02b8ba74dd37aff3'
         'bf86686c6f3f2ee640e6019922432386'
         'acab3807a5a8502710032efb0b1c2ddb'
         '83ad1bd9bdd341fea84dcd285212a453'
         '19575391e2289ae658454921d5fd8463'
         'bc02c3e619a487aad5825bf9f9e88ddc'
         'bafbb415cd758b732fa0cccb000ae77c'
         'f7e97400affe286d6b4d9e142c4f9846'
         '95811ff56ebf0f89535738c5ca8eb12c'
         '6db568b723aa618b90e5e6c77a026afa'
         '7956cd40a84b91d5df8d23073902f496'
         '953111234ea5faac8b6486ab1423a48e'
         '799cb35adc18f853fab834463fa20d5f'
         '9008ac9fb7278e237bc50ddbd702a5a0'
         '6cc72c12adffdfd01ad81b53ab9fea99'
         '00ff0b28f9b3ac4393603f02b6eec9d1'
         '307a26725270a2a1a284703e09dd13e6'
         '116aaf3342d5e4ad6e89a7dfbeb396d0'
         '8d8099e6f22fe7c858ad4488a5fecf77'
         'd4ea2064eeb78448fe6e72926d4e622b'
         '36598749f634970f509702f6f9b49e4a'
         'b8cf9a60323cbec42ec805b1b993e833'
         '4d1790be9369efaad00025e1f9215a44'
         '1205701c849755d00a4eb4aef0a477cf'
         '8816cc0e89cb04f6c1d2e7f0c08df4f6'
         'fc8a99d4f8848b7caad46c05c77418b6'
         'ae7c75c7daffa3a66f7391ee9e273163'
         'b7d1e76f97777bbb22765bf8b3dd71ad'
         'b1c06a47a40154f1c5e88df939689693'
         'b27d4a04c3ac6132fa975677ec0c8b7d'
         '0b37adffb6ad6948c1e91e0f819f7c19'
         'd377b9809c76e4c23fd1220ec6b53d68'
         '45c0a614c6a6cd1533a79483d0b4654d'
         'e1beec2f30e6fc4e89a9c58ca9a9de73'
         '068e54316b6e7ba1d1bfd973c7d3b059'
         'ae32da51cb4715541b6a9f2a5e3939f0'
         '0ca38fd8b36f42551016799eb262823b'
         '2e6f2270914cff35e0c7aef5f6ebd82c'
         '11ce603207f2546af540c4d1c27d287e'
         '7454e3e89f89bbaa747c0a2e93e656f6'
         '51a3b1a1ef5fe4b3d9c24de83e2fe65b'
         'f0c9c2de0aac95a08f6155f730ce628f'
         'ad6ae7590b0aad9cbb62703da5830b67'
         'caca95e284317fc356addc85a00e0124'
         'ae3f3a84c1fba2f4e13bddc868fc47e9'
         'bcaf1685fa5d19a68ce6e5c49c345cba'
         '7f1fd0d8d1c19fdb5da6dd5053a0ba36'
         'f3b22ecbd734443a5c99b9908eeaeb7e'
         '85eb84d8b56261f6f4ca511f3b99f0a7'
         'b919b4e8df73ef06e6cdfc49ed20e288'
         'fc64a78f4c7513930767797622924d3c'
         'c0bfb17b52723f06f5e5be61b3031dd9'
         'dc6ce921588efbff7c3230c500e41564'
         '31ab347314e501b747387a28e61e1d3c'
         '9b17af8c8e352ab66c5772c171871c28'
         '63921fe40d60c5bd6eff14f10065bc18'
         'b09b497925ae99f5b58fb854e1056f5b'
         '4a941d640a347d3876e3c606d6ec0e2b'
         '7db2e965f0dd2119910c49fe739e7a4e'
         '142737a14ac26b5bb63f275d143dc5de'
         'ac39fdef0e9d11d8eec9644491d67e95'
         'c404020f4ee57d612f51c6514527f456'
         'aa1670c15c9ee445c6b27973de080f08'
         'e8db0680922a406aed2a21c0576f295d'
         'fb42acd18639b831d1fa6f4fbcc148bc'
         '5c25912fa6012e177576e2871580e270'
         'e7a7da92d64a17be9d79dca87e818a15'
         'b9423634d027b085c84cee26e13db70a'
         '3f3f1a887702b525cda01f7cd776b241'
         '9e1c24a8ed076a03e4200225fd010d9f'
         '9a75b65bbb8757301cf5bf5a54c8df2a'
         'a580c429ba5130a697350dbb5fe64927'
         '8bfeacd2fee6af7c3d4b49686857d814'
         '49bd0e2a91dfa22c23df990f2d0908e0'
         '7dca2ed765480ede970aebb9d2a698f2'
         'b8dbd6078b1601dd3b69e330973ae606'
         'bceb1884fcf8c7b569cf64602ddc8ef0'
         SKIP)
