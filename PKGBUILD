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
#       C:\Windows\System32\license.rtf
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
pkgver=10.0.10586
pkgrel=1
arch=(any)
url='http://www.microsoft.com/typography/fonts/product.aspx?PID=164'
license=(custom)
depends=(fontconfig xorg-fonts-encodings xorg-mkfontscale xorg-mkfontdir)
provides=(ttf-font)
conflicts=(ttf-{vista,win7}-fonts)
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
            '7bff8efabe06bb665d168a1b063c1ae56e3edc058106adb1d8ec5f582f357174'
            '7026f5d48283461652eed1431682589371b7ee69361736d9b08eb9b90fa4538b'
            '7c59633f0ca496de0699e0a2254a4fa09f4de03ef79eec43660f6d029b49e067'
            'ef47a884633e8609cf735234d138aad5b636839cf0ce87cf88caf14e3b2f1a98'
            '7a8e617e60289a6628d47ae363b46e2b1af152d02dd6ec1fc5ecd1838dd2cbe1'
            '309ac11b8511a7b0cefd7b4972898045e4a13f1f46848708e7acb3c70198713a'
            '7b9a04876ce63d30288a854ffcfdeaa5c7e1cc5414daf424148b7166df061fce'
            '264634dcdf64e38432d21caeddae77ca1d9bcac8f4269ede0b67b31c8347c46e'
            '5b8ff475e63154922a39fbca84dc46bfff1fc1afd8df407fc207d1a02d06e71e'
            '83026ce856789e1243ff5382c50fa9fe2e6a43abdee10d7b882b19d23de9f7f5'
            'f2f5b2fd6afcc247c6fc429abb2ef9bebb58f5792a7a66efb390bd7ed5040eec'
            'f4cc0c11780a2d94cd6b74ed54fa657f26677013028c956ecb40da81c6b59b9e'
            'f959e0709a770094814199e49b0441b13e2bb075475b7ed2125ead7841ff2215'
            'da786a0df49cd2f45a9a8dc67120ec534e4624bf168829947bb08c4f937c21ad'
            'c2017a26bbd51775376baa93ba63095ba90a955c0eb93bbe44b9e73e0958fd73'
            '1300142c0886fca1155689241d1f6a3c6c6d3cb9c292e7a47db7e6417401ddee'
            'f13a7e4419f5e9d9b8efb2c436675f66607bf98e2d596b8c296d7b250f4c877b'
            '04bc106970b51bf365ac2d6f7c88d4171f489e512f42229d39a0fd375ca0f956'
            'c301881da0894256a919e819b944f1cad7eea8060330ff1a48acacd6323fd4b2'
            '3b4579e180eda33684cd578cff6b7db65a470bedc39b50d180b2adff4e002a2b'
            '94e25ff7bb7f5b6c5a71608d2b99760b751c812100308588a484481ac86d15d1'
            'f97558228f74cb0166f56943c6cd584d83ec5e35116d536f145c3cfb05deeed3'
            '0abb07a6e12f335966f4ba9562c02919043cbe3a69a6647b8e3fe4bbe472ee36'
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
            'a397369e610f01893fe888c3911f407861baf6f86e42c17816443dba6072e64e'
            '4e58ccaf7f117d138a0996c986d24d7adf9afc801b581ce58887e25cf044f113'
            'b16db0eade36cba0a5e699310c34efa38850f74a109d9865455179d9ab1cedc2'
            'c7028fd58bef5821f560ad69d710b4554395c771788ac22637345a5fc425eb53'
            'f93975b19a5d23890387f910786c7c7d4e91aeeb134690f1ea64278fa73f9371'
            'f4df4d6d1a69d24e08da2ad2f45203b4c7147ddaa5187ccd73087903ca36d177'
            'b9ed2bf08381f8b763673504d82b27c6e029156c73cede54e551e59fe8e940da'
            '511db37f04906eb2e77a91949edb04a61ce9838e9523011621dff4971a8d5867'
            '86e5279e747d09fdd94335e32d6245e5f7281f19cd1b603065b5871dfb10c773'
            '2e03ecf35b3643c33ec0d68488f24b1caebed6fe7b40706603e6ca5a4fcfb9e1'
            '66a97fa5d1afa922772377b68fc6a8c18eb11a9972a76da2aee6920c1e5b0bbf'
            'ffce42ca79bc15e453241e00a07bad6d4b1b1c1929a17a546b18602c999137e2'
            '1ec4e73e81f09fe867bb1e3a61496ac1eec382b53395ebf6b71b5c268a210f73'
            'ecf3f898c2970377f7853ff7d7dd973e069bb8fd6264a36c01fff56ee28af701'
            'f1b950b4ffbcd71c581ecdaea184b789e1dbbc43da6391c790c096812b20f769'
            '8f6328619340426b2c985f6fd305bb64d164b20b20a5b493a21533761bd5d631'
            'abf76b314ca2432ab718a74a4028bb7707073cb0d50643547c59f41a540b66a5'
            '740ccfb5e975133b4cba56c22a9d218a5764b1965ec1145e14aeccb36e0ababe'
            '009295cb8d529bfa6920317997eb3ebe0325c5ce1d3d7385ce7b9fed3c2d41d5'
            'c058fb5c59342f7d752977b294ebea5cbb3b886b7f81578712fe2e708e815c44'
            'bbfae94ba79a8f3303d8a18af3811557a4ce7a81a6b4333c2e80db83f319439e'
            'f7cdbb1cca197c07d53a8e13f7fab1b0fcf13c4e74641f07da6ec335cc86daf3'
            '4098759bea7de30a5d9d38f90e8d0efd1d2fbba59046d35bf37269d717fa775c'
            '99af6bcc95341bb123b40ae3a5ba5d1cbc8957dedfbe82cc6a80a02c08dfd86d'
            'fe6931430747f8f7927952b74caec56f864291168ae466eb6252f41da10ebcd4'
            '281d18627eafa6de4a31bfe2d4bed74ec20cd7f631e5a849930cc10b53f883b9'
            '0d32f374426334e8fb53e8dfd44509a1162eb059ea70c01b4de22111c6fcb10d'
            '41370e683e93b59e279d7b558e7b4f6bf3b313533c95426c23df35ccd02cefbc'
            'c6e214d8a89324d5d814f6e3bd42bcece02ef96d1f497e7acd9d5245a3192293'
            'eb902fb2aaf7733b678d4d82336a2cc5f0eb8d04a4ea86e2c73c41989f557599'
            '96b08997a68f989aed2fb9bbc691fd81d3885bd85fb98b51f937cba3f9ca9dec'
            '3f4a8c83facad884d49f301ffda80eb7ef61b119f3e6d844b0ea681eaaf0288e'
            '3bbc77511bd9ba9880c8b6ce797fff278cdef3df23d1782f6c4064f5620b3180'
            '299f52434e98c9e437eeae1c8f9348ce4118e30cf6c70aec5759c69460eaca67'
            'bd87d32c318ed103dd7e442baf6f58ccff3c757dab06e016918d821362c7feb3'
            'bedd8106542fc2c92df882e872ce97292617a37b4dc8b6b53a35ce41b9eac0b8'
            '00e3e3d43f72337c8e81e49ded3ee6b1568f924bbe54a9cf6f14a38f6b9cdfde'
            'fdba5038c6f0c340c6ec6660d260dba2779b57bd2889c70ab2cc210a56d581fc'
            'bffdc2fd675d9af414824ae84d8456504542480afb34fbc6bfd6903656c4f854'
            'c54d333bde41396409c7a4711bf1a366b899397ea27e9499eae67df9a42afebf'
            'a040897df47f5f9b5b49d9612860c52801ff97c6b696b6f4d7c33eca6a2781f9'
            'bd03fb7335c725148e192765164dd6efdb6841fd9fc889fcb3b573f00a316193'
            'f05eadb4f753e9a1a3bd5d9aac5d0ea503d8000988f9715634c9f93baaf2c395'
            '115d6e3283508911e303a1d2e72e2ada77c3a0be14d8d61877506c765e285a59'
            '73d8012b9dc0f531e7f18c62c61f9a602b41baefa65fe54b3b45ac923ee5dbe2'
            '55ce2a374c7f126ac4b62d521183d210dc05cc0705d3047889b693181bd557e6'
            '04c12ee2fdad4079bff1a5c52a5571401608f6968b3d4c4838f967ac7e351750'
            '6a04b204e22043c70bf8fdf087bc44a73ff3f225da141847588fc5ca885786c9'
            'b7a2604eebac664bc50461b94b6d26ed2bd7e39ac365ad25483ab867d0e1e9b1'
            'bbd6f974d877a53b320410529ff1e9295148b3bac5a14029910adac1607a77eb'
            '174568c4633a8a688d579d283f7508c16e437434fd5ac97d4ce30dfc42d0860b'
            '377be5cc51493f716c6aa89f539c532f78fc0b39c7ddd6c708a2dac345cda93b'
            '2c5aa27b62da26f432406852303acad6fdc9121b73f468c75fae33ade799ea81'
            '1161ce511c44eb5464a4f8144aaf3eb965a50ed66957ad7d38e497ab9d958e5a'
            'd7c38355bd52f52e043ed904f3463d476925300d1bdca9e842b28077ca3549b8'
            '8b10abdb0257c605bbff78c0117be955aa6e53ddfc1bd2c1c3309f8397f85c9d'
            '1b77bf0bef235a0d8deee3df548ae7d5ff6d170a7352066b64535fc06be9423a'
            '52753b7378b1ce61938e600253b6072e63f2d6caa8d67a8cbbb39ef6c711c62f'
            '4bf10805e829e1948a0862fe46c4a61c7b0b8fca9d0e93ba2688c7ee1964b7db'
            'bb4d44d1039448379bf2cc651145cd42eb0be40dffcce31897158f615bb8c8bb'
            '3a2ac5b511ae1a8f509be0f0831d22f5fd4d1fb407db73f9633fe2eca95259be'
            '21b1574e3ede2512a7afbc527a8bb31a83926267d348025a3ee4f18642e7ada7'
            'e7fabbb6bfae0697600cccd1cd87a4d43adad5aa0286d593ff4366681e2a60c7'
            '4cd4f18769d3ac768f54bd77e449d3f2abb94960bfb8cb9be296fd834f340178'
            'f57971d9387e0b762a29c8826dc39717b1a191ab3933d21e171da9b75d510792'
            '1a835b8d3d56bd3e0fbb61a39e2074516e6c54ae4b49caa00922c42a5c812c73'
            '01599994969eb9d99699a6c4d0108e5dc1b8a671f2c1150a7810d0adbbd61f8c'
            '2c61b719ebc6b73715fd295e76c99c8b23ce10e1d2f1985c2de355f6959002cb'
            'c4236f6b63fbb7cea53976ef908384925c6606177e8ed211d506466e166d8050'
            'ff34c98245769ac36546c9f8dfd7ae7b42b38560910bdf5fdeb75a90a60d8037'
            '50107f7f089481ef9a62c5f20e48eea21bb3f54cdc416c53288345c62c43d24d'
            '456fbb8858e64737feaa868f535dada4b6d7763d5efbe4255476ac5c4e2a1a9e'
            '1dafb0e3ac2dcb2eb20e7daab0a0c87eba2c74d3b0ea39df0056be0e995d824c'
            '882d0e800dec2ff49cf42595bb07eb815e70befbb618eef232dcd15af7e279e7'
            'a4d3594f888ab0bf446870433dbca3485a7a860a0eb48a0fc85b567645ac0cfe'
            'ca950c682dd753c726091025600f3c7f94760c83fef3ef0845a61035ee5a70cb'
            'a47b5bc40891d39189dcb28c6eb297f6104770dc447b57c5e21fd6182910ee2a'
            'b8bfacc2007fb364281a2d1fe4942971120fc106ce4c01cbea20cfe7f0e376f2'
            'bea454159291632db58c89a2c0b749f7606c178bd3f4d7193645792c5d557400'
            '79345f1db8f57a67b58a83ecdd45932b0bbed6f2b757d124fe0207ca2eae6ca4'
            '5759184fb477d80860862e4d9cc38f415c637136fef970269ec6088295edd5e5'
            'e414ce2cb5a62cef00cf184f7dbad32975a1db384f05e92dc5a9cad6a36d561a'
            '3cbacc17e690201f4872f18912082a24b96e88553f37ad721c5ce77e42e6c418'
            '48262d62fa676d54892b1f1bab01d688a05f9ac57c814f0a89fc6817d3dee8ee'
            '18ec29ada89a380a3e044fcce1148cbae8fd39cc2755c8070acabc0d41029c9c'
            'fe03477f86a344aee44688dcc13f883a2577160fa272c00dc21c9cb3f5b3239e'
            '41b9694a9335140a7fb6b6e53bf41d51e281bb2cee51053f98773cf18637378e'
            'eb9061bf0e2995da8a1148fea3afb73851804d0a09bc5fe8ac6d11b87f4c3d89'
            'bcd2ece54c61f5e20db1b2f60b4215274b3f9a92deba89e7b3f41085e1a31abb'
            '6d5d530326ce286f1afee0b71a6f2e4f4930e5bb99967710b6a9634e482e0ef2'
            '4be83a5bc229b50e3f18a071a2a3d09a408e9d6a807869b2a93645a40f45bb89'
            'd6fbfa966797c79844ca5fecf11dcd341544fdf76947d291133f079a3dac2e4c'
            'cf392fef1d5688c2b81059219494f574728bb830e7da093c3274afb9702ae8f9'
            '90aa8461b7d61e350495584e0ffcc3a5a3168048605e14b2fedb193b38012962'
            SKIP)

_package() {
    conflicts+=(${pkgname/10/8})

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
