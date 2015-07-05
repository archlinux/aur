# Maintainer: Martin Schmölzer <mschmoelzer@gmail.com>

# BUILD INSTRUCTIONS:
# ----------------------
# This package is intended as a more up-to-date replacement for the AUR
# 'ttf-ms-fonts' and 'ttf-vista-fonts' packages. It provides newer versions of
# the fonts in these packages, but due to license issues cannot automatically
# download the fonts.
#
# Instead, you must acquire them from a Windows 7 system or install media:
#  - Running Windows 7 system: fonts are located in C:\Windows\Fonts
#  - Windows 7 install media: fonts are located in sources/install.wim, which
#    is a "Windows Imaging Format" archive. This archive can be extracted with
#    7-zip (p7zip package): "7z x install.wim 1/Windows/Fonts"
#    Alternatively, you can use GNOME's File Roller (and maybe other archive
#    managers) to extract the files if the p7zip package is installed.
#
# You need the files listed in the source=() array. Place them in the same
# directory as this PKGBUILD file, then run makepkg.
#
# It is possible that the checksums don't match. This is due to the fact that
# different Windows releases may have older or newer fonts than the ones that
# were used to create the package. In this case, makepkg will refuse to build
# the package. To fix this, you have to replace the sha256sums=(...) entry in
# this PKGBUILD:
#  - Run "makepkg -g". It will generate the checksums for your files and print
#    them to the console
#  - Copy and paste them into this file, replacing the existing sha256sums=(...)
#    entry.
#
# Windows 7 SP1 has newer versions of the following fonts:
#  - Arial
#  - Cambria
#  - Gabriola
#  - Mangal
#  - Times New Roman
#  - Verdana
#
# These fonts can be extracted from the Windows 7 SP1 updater with the following
# commands:
#  $ cd ~/Downloads  # (or any other working directory)
#  $ wget http://download.microsoft.com/download/0/A/F/0AFB5316-3062-494A-AB78-7FB0D4461357/windows6.1-KB976932-X64.exe
#  $ cabextract -F *.tt[fc] -d win7_sp1 windows6.1-KB976932-X64.exe
#  $ mkdir sp1-fonts
#  $ find win7_sp1 -name *.tt[fc] -exec cp '{}' ./sp1-fonts/ \;
#
# This will copy the fonts to the "sp1-fonts" directory.

pkgname=ttf-win7-fonts
pkgver=7.1
pkgrel=8
pkgdesc="Microsoft Windows 7 TrueType Fonts"
arch=('any')
url="http://www.microsoft.com"
license=('custom')
depends=('fontconfig' 'xorg-mkfontscale' 'xorg-mkfontdir')
makedepends=('fontforge')
provides=('ttf-vista-fonts' 'ttf-ms-fonts' 'ttf-font')
conflicts=('ttf-vista-fonts' 'ttf-ms-fonts')
install=$pkgname.install

######################################################################################################
#        Normal         Light           Bold            Italic          Light+Italic     Bold+Italic  #
######################################################################################################
source=('arial.ttf'                     'arialbd.ttf'   'ariali.ttf'                     'arialbi.ttf'
        'ariblk.ttf'
        'comic.ttf'                     'comicbd.ttf'
        'cour.ttf'                      'courbd.ttf'    'couri.ttf'                      'courbi.ttf'
        'Gabriola.ttf'
        'georgia.ttf'                   'georgiab.ttf'  'georgiai.ttf'                   'georgiaz.ttf'
        'impact.ttf'
        'mangal.ttf'                    'mangalb.ttf'
        'times.ttf'                     'timesbd.ttf'   'timesi.ttf'                     'timesbi.ttf'
        'trebuc.ttf'                    'trebucbd.ttf'  'trebucit.ttf'                   'trebucbi.ttf'
        'verdana.ttf'                   'verdanab.ttf'  'verdanai.ttf'                   'verdanaz.ttf'
        'webdings.ttf'
        'wingding.ttf'
        'symbol.ttf'
        'calibri.ttf'   'calibril.ttf'  'calibrib.ttf'  'calibrii.ttf'  'calibrili.ttf'  'calibriz.ttf'
        'cambria.ttc'                   'cambriab.ttf'  'cambriai.ttf'                   'cambriaz.ttf'
        'Candara.ttf'                   'Candarab.ttf'  'Candarai.ttf'                   'Candaraz.ttf'
        'consola.ttf'                   'consolab.ttf'  'consolai.ttf'                   'consolaz.ttf'
        'constan.ttf'                   'constanb.ttf'  'constani.ttf'                   'constanz.ttf'
        'corbel.ttf'                    'corbelb.ttf'   'corbeli.ttf'                    'corbelz.ttf'
        'license.rtf')
sha256sums=('ca8c3f3b7608a6e8712b027ccbf584818f78e750da1240fcb5d8fa89a0b92747'
            '4033d5cfc2e1acb737c95b1a1bbada6ab7ea98933d67b254cb898fde433fa81d'
            'dee6a6959f9178752c56c3090a947c2fc3621dc265e4bf9e1a009ef56c44cf59'
            '29ce82c87cc7988ca642e01093c4606b2c5bdd6c860daf414b4ee7b17b5e002a'
            '6dab274b36928bc76b5002eac90a52f2450d07b9327be95acf2bea1e56e4e1da'
            'da6bd53ea1f8259e41b198d75e187676c6355086ea8cb3cb0e1690d5237f82a4'
            '8f5d4ac83aeee7dc1361585883ef59304edcfc57f4996be51e74aa3a07c5aa30'
            'c5e7cee4b77caf5ed5f1ffd7510fdb66d32109c6861b4a481b93b9166df03534'
            '89cff1ff9e59a661ba947500e9c242506e2dbf36c0417783dea8b762e13da704'
            'd9c60f6e55128b775b25f8e26b20b486c1a4de56f1d55348d5ab6200d9471b06'
            '5d51cebc9151f377f52b39cd34da80f9179236b1ba4f261ae4023c077114e27b'
            '29eaa6d65d0f1508d2d550d5ddf4e7e3a4e23cf13b376ff93140a8a6115b2f82'
            '46a57e3971f92d2359759f1cf0cc6706def7010a145786cf15c199e44ef9b061'
            '0537ac91f425795dda88d1a8ea66ae59f7357e5eb0c37309621003770c6ae160'
            'd691381f2476ed5ee1e80475a430b4864bf31fd46132b270eec1ce2672b4f8a2'
            '15f287c3345c2e64c2a2da053789dc0eef09ae0fc82a193ca64164b41d3565fe'
            'd9d7f0b973c131b0b7923a726f6f1de964b1073ec982106a027c3db53cf02633'
            '98f6cbbf8c0fb839c0ca08338bc8d2dcc3b4a7d79f3921c71cfd28edb40f3e47'
            '7f74007d58af4db8d77c9c1023f53d03dd87fb68bbd3c4e9d2fb080fabd092b9'
            'd9fb32eb1646d6fc977c63fd780a46c60b6d1f607bf55eb7baa185aa2637711d'
            '268218b3a0009bb3c3e3677c4d107de38a21f2a86cda6b4f6f3ec8e00171f43f'
            'd1baa654326673a6e49c22f3dc2638253a30565a2ae78a1f2c60a1e482230fc8'
            '21732df1135f9ccfbcac6818723f94c5ac3baced44b532a483e889906c4ad419'
            'b69a5b33e997c3bc55f35dde8267cb93fe5fbdc3ecbc23b1d987602a9fd2b1f2'
            '7fea7f91f1140721bd7837a36ed2b1c856215f3ac08e6d2eb29c1afe235d0900'
            '3f1d76cbf72de8cf7afbb6c4f3fcce5e5e89b92c8647310908aa42c44bd29b5c'
            'd374f4cc7819ad7a57204543b5ab01aa1580725bf2571eb66a25155216d90f3b'
            '7568b5a1a38aa5c2e5c486c3ac2e9a7ecd229e81dda726a2266bc935fb5af2fa'
            'd96a5071ed19b6bb2d467ccc9e3645ec10d4a2c14123dd64852719a0f39a8a2f'
            'a3c30d4f91e11d61aef3bd07e58eb50f1a8db2c37c257984794eead020747595'
            'bf2eb7af0acdedaf1984fe2e68c1eb5dcf69798c4161100272d086701e6b10cf'
            '1161ce511c44eb5464a4f8144aaf3eb965a50ed66957ad7d38e497ab9d958e5a'
            'd7c38355bd52f52e043ed904f3463d476925300d1bdca9e842b28077ca3549b8'
            'bffdc2fd675d9af414824ae84d8456504542480afb34fbc6bfd6903656c4f854'
            '6cc4055abce8101cfa3850031df0cc226341618d4361e23a7bc4d5f2ebb2807f'
            '853709c6521f9b211343a3e2b92c62a4a01074ded478b67fb88ad9d27c9f3e19'
            '009a5e879d37d75e8922a2786e64e7ee197762111f45ac0564262aa1d8f6f81e'
            'f09ea6e6c951fa17dd8b0ed4d68686c977eddfa616f5efc617efd0ad123c4cc9'
            '93798d1047507741959132e544bfc4a071ef060a59b71c76c1a7b684944acdab'
            '9378bb36eb676530f5fdc94dc4fcc73d63a6ec6ebb7d5eebe131254d7c51d2d2'
            'd675f6efa6f39c92585a0499901593c2df7a1b61cdb6bf4185e3833f83b0106e'
            '2613006fb72ac39d2629cc10dc4046191981bf3c0796addd4a728003271e018f'
            '71e671f7048248bba725729cd5e5f3b1378950bbfc9e592ad15af71df0780607'
            '2582aed03c3370a8fad2e9f93b4b4d30a0b1bafa61c51bf23b8d5f65a1ad53de'
            'f4cc0c11780a2d94cd6b74ed54fa657f26677013028c956ecb40da81c6b59b9e'
            'f959e0709a770094814199e49b0441b13e2bb075475b7ed2125ead7841ff2215'
            'da786a0df49cd2f45a9a8dc67120ec534e4624bf168829947bb08c4f937c21ad'
            'c2017a26bbd51775376baa93ba63095ba90a955c0eb93bbe44b9e73e0958fd73'
            '45c14a49e0ba2edc00b72afad9a930cad5c1b9a93323b239a8c308efc5a65e8e'
            '5c27a540c51a0e60b2caa4e9f6c9164fde89a9fdc560747bfa1658f6e556cf61'
            '18db132c539323badaf0e1c9ceffa497e1996946a8faac26cc5fbe6fc8233314'
            'fc9e9f0b6ae6d068b01e1511e475b508e15799529f53679f1e927f5418040c3f'
            '28401ef53647e4e68f2c2bda54856fe90d9afb1cf4072bf4ea9cf6b380c09d4c'
            '11a7a1c6b1b4028cd7e55f60a9773ecc7d39b66b8f82f5b7c6fbf8a4fdfcf94e'
            'be0306e2040aeeed8bf228524071f4b941d28cbdd3ff413a9db07d1da9213ec9'
            '6bf361ae27d2f67e05d9ad0fa6e0bc4e16c2ada6926d6c24b557e2547f4f242e'
            '83f5b36107f7ea50fd5c52b1c3e8d64de3edc5d0f2c2e2e9f634fbbcfd7abd74'
            '2d3fb4d471e9669a5ab2bc8aa9b359639e17af321510f3b878bae03bc259b056'
            '7e9cd651666dce6dd3ad37b8199c7798b226b8995d35e6b672b53ce0bbec59cb'
            '9c68522951940ad49354f4fce56b528414a7e83c44474ceea0582a5434693066'
            '096cdd18e26b2b3d8cf0b3ec6a1ffb5b0eaae0fcc2105e3c145f19037a42d467')

build() {
  cd "${srcdir}"

  # cambria.ttc is a TrueType Collection (TTC) which causes problems with
  # LibreOffice (Cambria Reguar cannot be selected) so we need to convert
  # the TTC into a TrueType Font (TTF).
  FONTFORGE_LANGUAGE=ff fontforge -c 'Open("cambria.ttc(Cambria)"); Generate("cambria.ttf")'
}

package() {
  cd "${srcdir}"

  # Prepare destination directory
  install -d -m 755 "${pkgdir}/usr/share/fonts/TTF"

  # Install fonts and license
  install -m 644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
  install -D -m 644 "license.rtf" "${pkgdir}/usr/share/licenses/${pkgname}/license.rtf"
}

# vim: set ts=2 sw=2 ft=sh noet:

