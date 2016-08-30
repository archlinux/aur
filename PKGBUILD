# Maintainer: Michael Lass <bevan@bi-co.net>
# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: reflexing <reflexing@reflexing.ru>

# Instructions were copied from ttf-ms-win8 and slightly modified:
#
# BUILD INSTRUCTIONS:
# -------------------
#
# Please note, that usage of Microsoft fonts outside running Windows
# system is prohibited by EULA (although in certain countries EULA is invalid).
# Please consult Microsoft license before using fonts.
#
# You can acquire fonts either from an installed and up-to-date Windows 10
# system or the most recent install medium.
#
# On the installed Windows 10 system fonts are usually located in
#       C:\Windows\Fonts
# and license file is
#       C:\Windows\System32\Licenses\neutral\_Default\Core\license.rtf
#
# How to acquire fonts from Windows 10 install medium:
#
#    You can freely download the Windows 10 Enterprise 90-day evaluation from:
#
#       http://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-enterprise
#
#    Fonts are located in 'sources/install.wim' file on the ISO, which
#    is a 'Windows Imaging Format' (WIM) archive.
#
#    You can extract WIM using wimextract ('wimlib' package from AUR) or
#    7z ('p7zip').
#
#    Put the following script together with previously extracted
#    'install.wim' and execute:
#
#       wimextract install.wim 1 /Windows/{Fonts/"*".{ttf,ttc},System32/Licenses/neutral/"*"/"*"/license.rtf} --dest-dir fonts
#
#    Fonts and license will be located in the 'fonts' dir.
#
# You need all files listed in the _ttf_ms_win10[_*] arrays.Place them in the
# same directory as this PKGBUILD file, then run makepkg.

pkgbase=ttf-ms-win10
pkgname=($pkgbase{,-japanese,-korean,-sea,-thai,-zh_cn,-zh_tw,-other})
pkgver=10.0.14393
pkgrel=2
arch=(any)
url='http://www.microsoft.com/typography/fonts/product.aspx?PID=164'
license=(custom)
depends=(fontconfig xorg-fonts-encodings xorg-mkfontscale xorg-mkfontdir)
provides=(ttf-font)
conflicts=(ttf-vista-fonts)
install=$pkgbase.install

_ttf_ms_win10=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
arial.ttf      arialbd.ttf    ariali.ttf     arialbi.ttf    # Arial
ariblk.ttf                                                  # Arial Black
calibri.ttf    calibrib.ttf   calibrii.ttf   calibriz.ttf   # Calibri
calibril.ttf                  calibrili.ttf                 # Calibri Light
cambria.ttc    cambriab.ttf   cambriai.ttf   cambriaz.ttf   # Cambria
Candara.ttf    Candarab.ttf   Candarai.ttf   Candaraz.ttf   # Candara
comic.ttf      comicbd.ttf    comici.ttf     comicz.ttf     # Comic Sans MS
consola.ttf    consolab.ttf   consolai.ttf   consolaz.ttf   # Consolas
constan.ttf    constanb.ttf   constani.ttf   constanz.ttf   # Constantia
cour.ttf       courbd.ttf     couri.ttf      courbi.ttf     # Courier New
corbel.ttf     corbelb.ttf    corbeli.ttf    corbelz.ttf    # Corbel
framd.ttf                     framdit.ttf                   # Franklin Gothic Medium
Gabriola.ttf                                                # Gabriola
georgia.ttf    georgiab.ttf   georgiai.ttf   georgiaz.ttf   # Georgia
impact.ttf                                                  # Impact
lucon.ttf                                                   # Lucida Console
l_10646.ttf                                                 # Lucida Sans Unicode
marlett.ttf                                                 # Marlett
micross.ttf                                                 # Microsoft Sans Serifc
pala.ttf       palab.ttf      palai.ttf      palabi.ttf     # Palatino Linotype
segoepr.ttf    segoeprb.ttf                                 # Segoe Print
segoesc.ttf    segoescb.ttf                                 # Segoe Script
segmdl2.ttf                                                 # Segoe MDL2 Assets
segoeui.ttf    segoeuib.ttf   segoeuii.ttf   segoeuiz.ttf   # Segoe UI
seguibl.ttf                   seguibli.ttf                  # Segoe UI Black
seguiemj.ttf                                                # Segoe UI Emoji
seguihis.ttf                                                # Segoe UI Historic
segoeuil.ttf                  seguili.ttf                   # Segoe UI Light
seguisb.ttf                   seguisbi.ttf                  # Segoe UI Semibold
segoeuisl.ttf                 seguisli.ttf                  # Segoe UI Semilight
seguisym.ttf                                                # Segoe UI Symbol
Sitka.ttc      SitkaB.ttc     SitkaI.ttc     SitkaZ.ttc     # Sitka
sylfaen.ttf                                                 # Sylfaen
symbol.ttf                                                  # Symbol
tahoma.ttf     tahomabd.ttf                                 # Tahoma
times.ttf      timesbd.ttf    timesi.ttf     timesbi.ttf    # Times New Roman
trebuc.ttf     trebucbd.ttf   trebucit.ttf   trebucbi.ttf   # Trebuchet MS
verdana.ttf    verdanab.ttf   verdanai.ttf   verdanaz.ttf   # Verdana
webdings.ttf                                                # Webdings
wingding.ttf                                                # Wingdings
)

_ttf_ms_win10_japanese=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
msgothic.ttc                                                # MS Gothic
YuGothR.ttc   YuGothB.ttc                                   # Yu Gothic
YuGothM.ttc                                                 # Yu Gothic Medium
YuGothL.ttc                                                 # Yu Gothic Light
)

_ttf_ms_win10_korean=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
malgun.ttf     malgunbd.ttf                                 # Malgun Gothic
malgunsl.ttf                                                # Malgun Gothic Semilight
)

_ttf_ms_win10_sea=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
javatext.ttf                                                # Javanese Text
himalaya.ttf                                                # Microsoft Himalaya
ntailu.ttf     ntailub.ttf                                  # Microsoft New Tai Lue
phagspa.ttf    phagspab.ttf                                 # Microsoft PhagsPa
taile.ttf      taileb.ttf                                   # Microsoft Tai Le
msyi.ttf                                                    # Microsoft Yi Baiti
monbaiti.ttf                                                # Mongolian Baiti
mmrtext.ttf    mmrtextb.ttf                                 # Myanmar Text
Nirmala.ttf    NirmalaB.ttf                                 # Nirmala UI
NirmalaS.ttf                                                # Nirmala UI Semilight
)

_ttf_ms_win10_thai=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
LeelawUI.ttf   LeelaUIb.ttf                                 # Leelawadee UI
LeelUIsl.ttf                                                # Leelawadee UI Semilight
)

_ttf_ms_win10_zh_cn=( # Chinese (Simplified)
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
simsun.ttc                                                  # NSimSun
simsunb.ttf                                                 # SimSun-ExtB
msyh.ttc       msyhbd.ttc                                   # Microsoft YaHei
msyhl.ttc                                                   # Microsoft YaHei Light
)

_ttf_ms_win10_zh_tw=( # Chinese (Traditional)
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
msjh.ttc       msjhbd.ttc                                   # Microsoft JhengHei
msjhl.ttc                                                   # Microsoft JhengHei Light
mingliub.ttc                                                # MingLiU_HKSCS-ExtB
)

_ttf_ms_win10_other=(
#########################################################################################
# Normal         Bold          Italic        Bold+Italic    #  Full name                #
#########################################################################################
ebrima.ttf     ebrimabd.ttf                                 # Ebrima
gadugi.ttf     gadugib.ttf                                  # Gadugi
mvboli.ttf                                                  # MV Boli
)

DLAGENTS+=("file::/usr/bin/echo ${BOLD}${RED} Unable to find %u, please read the PKGBUILD ${ALL_OFF}")

source=(${_ttf_ms_win10[@]/#/file://}
        ${_ttf_ms_win10_japanese[@]/#/file://}
        ${_ttf_ms_win10_korean[@]/#/file://}
        ${_ttf_ms_win10_sea[@]/#/file://}
        ${_ttf_ms_win10_thai[@]/#/file://}
        ${_ttf_ms_win10_zh_cn[@]/#/file://}
        ${_ttf_ms_win10_zh_tw[@]/#/file://}
        ${_ttf_ms_win10_other[@]/#/file://}
        file://license.rtf)

sha256sums=('95766b58f7d869b0fa2cf6e6feb26c1b21cdf2631f1c5863fc9bd206d5c6e8ee'
            '61daedc4107c937e66911b8184688601ac70f9c27f19d069c3b38f892fa314e4'
            '7645ce18dc998e1280590f2ecce73d5ea0f4944229d4595a38b699ee88f4f102'
            '3e1b042729be1d73f6c4071482b06c0ff16a031d5f9ebda861fe5e3d1293573a'
            '276297bd8468dd434f6a7fedb86c216d1cde8646b2657ac9f7edf05250d7107e'
            'd7114f0913256fa13f757eb2db8669c5f6dfd2fe2afa4e161e15d9e3574e6dc1'
            'd496bc5bc23cd6bcdf3ebbb596d3387221ddfb3cdcbcecbe3bb55064b5436688'
            'd880bdcf6f269277651cf7c3cb5475d95f0583a9a3313201155c688dd0fcac85'
            '17e06903abefbb591b7b1db20be3f8b8505a271fb8410584f93cfaad397816c5'
            'c1e5340407e7ecfd316a3b571815ceff6db27799b870a858fc2798dcca8521cc'
            'ddc96cf91f8238c80758a0ea83a16640b5152f260bc3d958191ab6159dcf27b1'
            '7ec299c05eeffe070d2ae0e868cebe89ebb294328f450aea695bc962a1435dfe'
            '6200d42cc590f8e66737de0ea4c3ed49351c4c9036ccd4259ec67a6495b17220'
            '35981b260926e0d078200a79d351f6294b23c506cc0740baab34264df9c48909'
            '8325eaafa2c0d1bc1e98bb8c14ba9a27d9f311bd92be6bb16e8080c9bb3e8134'
            'f4cc0c11780a2d94cd6b74ed54fa657f26677013028c956ecb40da81c6b59b9e'
            'f959e0709a770094814199e49b0441b13e2bb075475b7ed2125ead7841ff2215'
            'da786a0df49cd2f45a9a8dc67120ec534e4624bf168829947bb08c4f937c21ad'
            'c2017a26bbd51775376baa93ba63095ba90a955c0eb93bbe44b9e73e0958fd73'
            'd6bb7a8c9a541e6257721ba9f95adf2ca67f6a6000ec41873ec6003f24adaa87'
            'b2f6a26f18c0ef8d0587fe248086344899b26acaf3c3f560f03dbc5f25f7500e'
            'c38443ce27844c543cb65d35891e195242839d318221a96d050ec19c83aeac7c'
            '81a7e7db0d1988a98a7c9110be3bc9e3e0da22ce5a2e818de9bdb15408dc0482'
            '0c15e5de404d4545ce725c8b80502ce9b81971b3b2ee162478f28a51e1bc8cf2'
            'e400552b4933a7e077232c41a219ba086026019734b501abc12015007d9bdb04'
            'ed61c3ba713c0d626cf801c1389827d1433729e20fa14606f22761932795fc04'
            '5109099320ade817d4ceef5626218f54f4391833f262e181e88b669ebf37f4db'
            'cbe6c682f09b600d45f614be798a096c2a784c568020319e6168eec3f0619dc0'
            '11a7a1c6b1b4028cd7e55f60a9773ecc7d39b66b8f82f5b7c6fbf8a4fdfcf94e'
            'be0306e2040aeeed8bf228524071f4b941d28cbdd3ff413a9db07d1da9213ec9'
            '6bf361ae27d2f67e05d9ad0fa6e0bc4e16c2ada6926d6c24b557e2547f4f242e'
            'd4557f9674de7c5ef58ad4c3651016944672c6bf1f5e9253abfeea9730939808'
            '48aa67a7e051b3b01971d23cde77a7712dd0ef17b46a76db3f560c3b12e51215'
            'b707a469f233edff709f51e7bcba2e69f1f52460d8ee2d510707a7cac103b498'
            'd9046a0be729b2a547555df405517545dd2ea4930d67d578013166f0fbfacfd0'
            '83f5b36107f7ea50fd5c52b1c3e8d64de3edc5d0f2c2e2e9f634fbbcfd7abd74'
            '2d3fb4d471e9669a5ab2bc8aa9b359639e17af321510f3b878bae03bc259b056'
            '7e9cd651666dce6dd3ad37b8199c7798b226b8995d35e6b672b53ce0bbec59cb'
            '9c68522951940ad49354f4fce56b528414a7e83c44474ceea0582a5434693066'
            '2d648599fc7acacb024ab08a0720a62e2f2cc070ff19582eb9b5c824e1515ecb'
            '68f1597a57a071f291449e66c888c1b86ad617d8eb18da52c7c2dbdf781ddc2f'
            '29eaa6d65d0f1508d2d550d5ddf4e7e3a4e23cf13b376ff93140a8a6115b2f82'
            '65131f813491ca3bb4133bd5b877bc3725169c95e04beaebfa9108b31b404987'
            'c3a6870d0bfff812c89fcb9daca4884289499f41b199e94f9cb84d8c3c4766e8'
            '692c113d88993bf84ef34cb627f268ec3f074c5cfcca263e1cdfa2340da00b8a'
            '2e5dbc43b71568e2f506f4d68ff42c026e74f0909d64dd935d3e54be71d0ee9b'
            'f93975b19a5d23890387f910786c7c7d4e91aeeb134690f1ea64278fa73f9371'
            'f4df4d6d1a69d24e08da2ad2f45203b4c7147ddaa5187ccd73087903ca36d177'
            'b9ed2bf08381f8b763673504d82b27c6e029156c73cede54e551e59fe8e940da'
            '511db37f04906eb2e77a91949edb04a61ce9838e9523011621dff4971a8d5867'
            'd5894e49d5b94b3bcba9a28eb067f597815c2482fc4f5c099bde55e3eb4dabd4'
            '2e03ecf35b3643c33ec0d68488f24b1caebed6fe7b40706603e6ca5a4fcfb9e1'
            '66a97fa5d1afa922772377b68fc6a8c18eb11a9972a76da2aee6920c1e5b0bbf'
            'ffce42ca79bc15e453241e00a07bad6d4b1b1c1929a17a546b18602c999137e2'
            '1ec4e73e81f09fe867bb1e3a61496ac1eec382b53395ebf6b71b5c268a210f73'
            'ecf3f898c2970377f7853ff7d7dd973e069bb8fd6264a36c01fff56ee28af701'
            'f1b950b4ffbcd71c581ecdaea184b789e1dbbc43da6391c790c096812b20f769'
            '1f213cda18b1818f13f0007af89a5074c8d95d7e860f71dd6d58bfba32c201c4'
            '3f5df01829d2917762f7866c8c52ca7ec5e7ef7ca4d688be7fa1393d25e83cb4'
            'e94fd7d497b2fdc55a5ab2065a0fe2b68114c4d954b829dfdb8b08e7087427a8'
            '009295cb8d529bfa6920317997eb3ebe0325c5ce1d3d7385ce7b9fed3c2d41d5'
            'c058fb5c59342f7d752977b294ebea5cbb3b886b7f81578712fe2e708e815c44'
            'bbfae94ba79a8f3303d8a18af3811557a4ce7a81a6b4333c2e80db83f319439e'
            'f7cdbb1cca197c07d53a8e13f7fab1b0fcf13c4e74641f07da6ec335cc86daf3'
            '4098759bea7de30a5d9d38f90e8d0efd1d2fbba59046d35bf37269d717fa775c'
            '99af6bcc95341bb123b40ae3a5ba5d1cbc8957dedfbe82cc6a80a02c08dfd86d'
            'f3410cc6a41d4cc4526f4fe8eb7b55e4f33f2d27aaa60aad5d1e10b173c81736'
            '281d18627eafa6de4a31bfe2d4bed74ec20cd7f631e5a849930cc10b53f883b9'
            '0d32f374426334e8fb53e8dfd44509a1162eb059ea70c01b4de22111c6fcb10d'
            '41370e683e93b59e279d7b558e7b4f6bf3b313533c95426c23df35ccd02cefbc'
            'c6e214d8a89324d5d814f6e3bd42bcece02ef96d1f497e7acd9d5245a3192293'
            'eb902fb2aaf7733b678d4d82336a2cc5f0eb8d04a4ea86e2c73c41989f557599'
            '96b08997a68f989aed2fb9bbc691fd81d3885bd85fb98b51f937cba3f9ca9dec'
            '3f4a8c83facad884d49f301ffda80eb7ef61b119f3e6d844b0ea681eaaf0288e'
            '22c5a4f814862c20044d8941ca5a8e315adb595321dace968cdd57057da5f8e2'
            '299f52434e98c9e437eeae1c8f9348ce4118e30cf6c70aec5759c69460eaca67'
            'bd87d32c318ed103dd7e442baf6f58ccff3c757dab06e016918d821362c7feb3'
            'bedd8106542fc2c92df882e872ce97292617a37b4dc8b6b53a35ce41b9eac0b8'
            '00e3e3d43f72337c8e81e49ded3ee6b1568f924bbe54a9cf6f14a38f6b9cdfde'
            '6298552f7abd47882041ec8a28600010ac4e492b1be913bfa74c341dbd145822'
            'bffdc2fd675d9af414824ae84d8456504542480afb34fbc6bfd6903656c4f854'
            '7d2cb4fb74e064c3b4f067bea4393753cb3e3b4b9c9c2eaf9965449f21d9a89d'
            '13973a574c1a53f3fea0f7a9cd8f80b84ecec70e0189cf3b32640a2f0e3ebc8a'
            '537e0c545f17f02f2a2c522f22b99ee2363ed9cb5e3bb4b41ccd7ae9551fcd4c'
            'c67025b5a6c0be31d155d2ea2c26aa6436b8db17d350ee101fedd4e3d18d3f30'
            '41df8aa685e283b533e7ab2c79d1d6c210bc8a59d240f16fa4876c41a72f1347'
            'f38b1ffb712557c0d38d8dce163d6542c2ac4d999ba7445700dddb105246685d'
            '4c898145fff6565e31b408d09a8c4e4373e9ea3303508feabb819fd89f0d7779'
            '3cd58e45cf0cea4e225a2e21214aca22743f1bb9ba2a4d7e84e0594d53a9f6c3'
            'bd363e4f2baa7178bbe5eba290ef613e7c7bdc82cfa6946ed8a83bcae58b55af'
            '8e6dd44bbdb7bff7108a6afda4e369ae822ffa41c367aab2e411823e1cb135f0'
            '5d656dd21ade01e0773ee2173e957d036ac8178af859f373e5092d0ea74e2619'
            '19178be404b9223b4b13031ffb587530b045feb0db2bc4a97580253712da79bf'
            'cc485975199740dc064701e246efaa515a848a9b60f9c21925f2feb9d65c05f4'
            'a6f1978c6f6917bacb8eb98062e090cc7a7190c320f9da65b4837948b0e60544'
            '1161ce511c44eb5464a4f8144aaf3eb965a50ed66957ad7d38e497ab9d958e5a'
            'd7c38355bd52f52e043ed904f3463d476925300d1bdca9e842b28077ca3549b8'
            '762bf8b66dddc38a05a379d16b9b86c3253a2c78cbe1e81a1cc49b18838d55bb'
            '682d663388385c3cc90d067f57eec2f4f0d59f3dd4d204eea48fd30a7ac8fc34'
            '1b97a11c7902dac0d166916b18f5e6137dbcdfec8a20bb2f73029e9209cc8d6b'
            '029f4bfe0bde936f0b2c8abb24fe7a1c2c6ee365d9f5b910404f1c0802865e13'
            'd3692b19eb2289bf7cdf3d5fc1b961d8729fa6fcc5a09105ea65fa4ba024b5b9'
            '07b0857258866b29e414926f342bc75b028bc8d953a348abdbd7e3f2765e01d7'
            '3a2ac5b511ae1a8f509be0f0831d22f5fd4d1fb407db73f9633fe2eca95259be'
            '0858905b1b34e0e32ca4cdc898e61b5d7c88cedf58a15254f9d7886b6912e508'
            'f5e4bf84d8fe15c5eebb665c316b9db02cbfeef082502c2830260f15543368c5'
            '224c90a70ca4f4fd83653cc5f01100241ab02b57e989b62d9bb3ffe5fac9f353'
            '70b82383feb9fd57278a95f19ec4ed95ca1303f6f3610241f299e66f554b40bd'
            '1b89b17ac47f3715774dbc271518e8ab1c4c9ff1ef225f6fe2c091e9701560db'
            '5027f89364904707b2ee456eb0023a9fb3f4a723c98922e21ccef3da2b58b066'
            'c7f6396ce265378990a850c59a0bed7ea25c2d7d5dc56eab27efbf8d3e6bd7fc'
            '931460ac9acfb43c180291866c1c2761f9bdb33201e3a8abaa2a9cdff8069923'
            '5f1f805ca07b94d4c5e2c7618951514204f84d1142994ddbe180fc0022045cd3'
            'e221bd66c46cf0b554229b9ee4a2db1ab3e599ea87136b58250a2d2df46d672b'
            '6467b8efb9f8011b1545a4532c6dd8357fccb92181c3bdd89976ee349ce7c9d7'
            '28db38a32cc82256ef958b4562f8f1aadbcbb2d3eb27c323d3279fae7a840fbc'
            'a8752ae10ec17487d48e36081e88dc16ba754aa851a3a0f5b43c49a1af028631'
            'de75fea6cc2ce24e25c04372dfc4785a07e42ec644fd24d992004d453fb27885'
            'b4e1ecd53e94d9d78ea4b3b154a2e7d1b05d20bc7adb62e0ce00162f5eeda3f7'
            '9f779df3a6a9105457380425f7085f0b6d5b9e4c6bf9b7827f436bc833f2ddad'
            'b8bfacc2007fb364281a2d1fe4942971120fc106ce4c01cbea20cfe7f0e376f2'
            'bea454159291632db58c89a2c0b749f7606c178bd3f4d7193645792c5d557400'
            '79345f1db8f57a67b58a83ecdd45932b0bbed6f2b757d124fe0207ca2eae6ca4'
            'caa94915db5f9a98a6e50db710792c68c0fd273ada3b463a064a686e1b666903'
            '6f73f97552d4fb60d6882fb7e843dd8eba4dc123af9697bcc9b8813e536036f6'
            '3f26fd5546e32933df79254c1c1d68fc845c1547902e920023314eeb74897023'
            '7c1dc02b9a532223a44bb52ecc97400186236d39c4716884ee1e55ccb82aab80'
            '71b4bb870f7a752ee803f53e4d61d7639d48e71ac10e98679c6b4cbc5d87010b'
            'd95ee6543f979d8179cedfd9575b86365edd497f0c618954ee44e255a40ea9cc'
            '932c9acd04f3212bc4518e740af20e247647ed9935ab4d7984d135bdfa2aca77'
            '4e12780817f15d2e8df3fc26572e080cd0b5fa0e610f180fb9d76dd2bde0587b'
            'bcd2ece54c61f5e20db1b2f60b4215274b3f9a92deba89e7b3f41085e1a31abb'
            '17dbc64128a1c0d5463e61a9ee330be1fbd35411c2e85625be8daeb7baa19b57'
            '045f67887bf9347cebf12e153a3d7a10d48c064eae9fec936834debf520e8195'
            '6c6f2eac0118af7d12acb6770319beec83e9d6b6328767a22fd781e2166275cd'
            'd69e49c8e8d0abd2effb75845754c825f3694928879be3bc45daa035b9a5e64a'
            '90aa8461b7d61e350495584e0ffcc3a5a3168048605e14b2fedb193b38012962'
            SKIP)

_package() {
    conflicts+=(${pkgname/10/8} ttf-win7-fonts${pkgname##*10})

    install -Dm644 $@ -t "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 license.rtf -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_ttf-ms-win10() {
    pkgdesc='Microsoft Windows 10 TrueType fonts'
    provides+=(ttf-tahoma ttf-ms-fonts)
    conflicts+=(ttf-tahoma ttf-ms-fonts)
    _package ${_ttf_ms_win10[@]}
}

package_ttf-ms-win10-japanese() {
    pkgdesc='Microsoft Windows 10 Japanese TrueType fonts'
    _package ${_ttf_ms_win10_japanese[@]}
}

package_ttf-ms-win10-korean() {
    pkgdesc='Microsoft Windows 10 Korean TrueType fonts'
    _package ${_ttf_ms_win10_korean[@]}
}

package_ttf-ms-win10-sea() {
    pkgdesc='Microsoft Windows 10 Southeast Asian TrueType fonts'
    _package ${_ttf_ms_win10_sea[@]}
}

package_ttf-ms-win10-thai() {
    pkgdesc='Microsoft Windows 10 Thai TrueType fonts'
    _package ${_ttf_ms_win10_thai[@]}
}

package_ttf-ms-win10-zh_cn() {
    pkgdesc='Microsoft Windows 10 Simplified Chinese TrueType fonts'
    _package ${_ttf_ms_win10_zh_cn[@]}
}

package_ttf-ms-win10-zh_tw() {
    pkgdesc='Microsoft Windows 10 Traditional Chinese TrueType fonts'
    _package ${_ttf_ms_win10_zh_tw[@]}
}

package_ttf-ms-win10-other() {
    pkgdesc='Microsoft Windows 10 Other TrueType fonts'
    _package ${_ttf_ms_win10_other[@]}
}

# vim: ts=4 sw=4 et
