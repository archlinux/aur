# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="powder"
_pkgname="powder-toy"
pkgname="${_pkgname}-bin"
pkgver=99.3.384
pkgrel=1
pkgdesc="Desktop version of the classic falling sand physics sandbox, simulates air pressure, velocity & heat!"
arch=('aarch64' 'x86_64')
url="https://powdertoy.co.uk"
_url="https://github.com/The-Powder-Toy/The-Powder-Toy"
license=('GPL-3.0-only')
depends=('glibc' 'hicolor-icon-theme')
provides=("${_pkgname}" 'powdertoy-bin')
conflicts=("${_pkgname}" 'powdertoy-bin')
replaces=('powdertoy-bin')

declare -rAg _appstrings=(
  [APPNAME]="The Powder Toy"
  [APPCOMMENT]="Physics sandbox game"
  [APPEXE]="${_pkgname}"
  [APPID]="uk.co.powdertoy.tpt"
  [APPDATA]="The Powder Toy"
  [APPVENDOR]="powdertoy"
  [MANIFEST_DATE]=""
  [DISPLAY_VERSION_MAJOR]="${pkgver%%.*}"
  [DISPLAY_VERSION_MINOR]="$(echo "${pkgver}" | sed 's/^[0-9]*\.\([0-9]*\).*/\1/')"
  [BUILD_NUM]="${pkgver##*.}"
)

_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
        "${_pkgsrc}-${_appstrings[APPEXE]}.6::${_url}/raw/refs/tags/v${pkgver}/resources/${_binname}.man"
        "${_pkgsrc}-${_appstrings[APPVENDOR]}-save.xml::${_url}/raw/refs/tags/v${pkgver}/resources/save.xml"
        "${_pkgsrc}-${_appstrings[APPID]}.appdata.xml::${_url}/raw/refs/tags/v${pkgver}/resources/appdata.template.xml"
        "${_pkgsrc}-${_appstrings[APPID]}.desktop::${_url}/raw/refs/tags/v${pkgver}/resources/${_binname}.template.desktop"
        "${_pkgsrc}-application-vnd.${_appstrings[APPVENDOR]}.save.16x16.png::${_url}/raw/refs/tags/v${pkgver}/resources/generated_icons/icon_cps_16.png"
        "${_pkgsrc}-application-vnd.${_appstrings[APPVENDOR]}.save.32x32.png::${_url}/raw/refs/tags/v${pkgver}/resources/generated_icons/icon_cps_32.png"
        "${_pkgsrc}-application-vnd.${_appstrings[APPVENDOR]}.save.48x48.png::${_url}/raw/refs/tags/v${pkgver}/resources/generated_icons/icon_cps_48.png"
        "${_pkgsrc}-application-vnd.${_appstrings[APPVENDOR]}.save.256x256.png::${_url}/raw/refs/tags/v${pkgver}/resources/generated_icons/icon_cps.png"
        "${_pkgsrc}-application-vnd.${_appstrings[APPVENDOR]}.save.svg::${_url}/raw/refs/tags/v${pkgver}/resources/icon_cps.svg"
        "${_pkgsrc}-${_appstrings[APPVENDOR]}-${_appstrings[APPEXE]}.16x16.png::${_url}/raw/refs/tags/v${pkgver}/resources/generated_icons/icon_exe_16.png"
        "${_pkgsrc}-${_appstrings[APPVENDOR]}-${_appstrings[APPEXE]}.32x32.png::${_url}/raw/refs/tags/v${pkgver}/resources/generated_icons/icon_exe_32.png"
        "${_pkgsrc}-${_appstrings[APPVENDOR]}-${_appstrings[APPEXE]}.48x48.png::${_url}/raw/refs/tags/v${pkgver}/resources/generated_icons/icon_exe_48.png"
        "${_pkgsrc}-${_appstrings[APPVENDOR]}-${_appstrings[APPEXE]}.256x256.png::${_url}/raw/refs/tags/v${pkgver}/resources/generated_icons/icon_exe.png"
        "${_pkgsrc}-${_appstrings[APPVENDOR]}-${_appstrings[APPEXE]}.svg::${_url}/raw/refs/tags/v${pkgver}/resources/icon_exe.svg")
source_aarch64=("${_pkgsrc}-aarch64::${_url}/releases/download/v${pkgver}/${_binname}-v${pkgver}-aarch64-linux-gnu")
source_x86_64=("${_pkgsrc}-x86_64::${_url}/releases/download/v${pkgver}/${_binname}-v${pkgver}-x86_64-linux-gnu")
b2sums=('df98cf7cbf0951e6f53ccaa558e1ff886e9aa4cd7cca6823e547bc7576a736e81f2acdf7b4f6133575bb7d1b0fdbb6804c2b6fbacd9c305ae52d38bb49b42596'
        'ab7e38fc42fb6686add7393ecc3c7ec622cc0d72d0304ded3e56c2f96dc8433c584520896a30c037affa44461ecccfaf3ffa4a97a7e050e8ed0ec4c592caa45c'
        'f522a3367e2b6a6dd9f534caf317ea54c39ce9867ad2e1a70f2c087c1842fc75d4d5797fe4bc3972e2950036da80cfcf61b7fbf82e225f615db5a19bed504098'
        'bcc78f20ceebc444d5da04b75f2d9225559d27d4d27398898cb2a71abf56a77af39af0cc041c8a302ad872a63c3fa4c366726adc9e3de589b361b98a36ac7c6a'
        '48e7b8e545a64a9f9ea676c67e038cece255434cbb4dea971d79472d79a9355184a31d856c1209d4dd5f45d4074fd90af61f9bb1a802fa30890056f75fe58d4c'
        'e4195bfdb9558260c2b1972780d66ee524463c75cccd010969671dfc291442923ff266cfabe76ceed1b4eed64c042c402c698941051fb628e399aaf0cf0655e7'
        'b365f33e68a474664d079a2ff1d9ce5f7b9f45e05464dc324713e8fa68af8da203a37644f911e24029ab3c99716b42094244edb5586f25c029c42426b7a6bb86'
        'fd82487050af87145f5c4af0719e98a043b679c3659642b757bfb3087f5dcde5b6658dd28fd7ac7b7882e08817080b00e3e59d5f4e52e0ec9c9de8faf10651a9'
        'fd993050948a10e17a17aca1ab1a477665c3fdb5c4937e25962cf455de7c041d03bb64ff33fa883aea454201cfe4c3981547bb154be869b6d9a935eebe8b595e'
        '09eb7f1a4597de9cb23ad104c4da73c51452d7aa402f834d483d450fc010b8b9b168a3a488a6e686630bd94ca55a4ada1c61a8ed7b2bd01dec954538a59827a9'
        'de800ad5a4bbff59d0e9befbb2d69e5c7228e2de7cd3de9fb188adb63c3d2799e48115cc60a67fa64bb27c3bc59753ee191cf56da62a65651811d731defef1ab'
        'c593f28b931a310ee42abb777ccd6860503833fb96b9f6cdbc122950a110bf8e030fa382a17e1d93495ed80b6790d69306f655bd95e51fc25a7699c2f3a2d07b'
        '6fc61681cbf3880b3618a1cc586715d6f3ae3ca122ae082a08472928120228c23329364e1c249e59cc0dfea5de7e4f5f67a32edbd81637621a3bc4e3785fde3c'
        'e8a59b62bed02ee8cf45c903273bd030cf27fd1077931ab0b1a8f788d60adbd2f55925cc90b713604adab0f63f88e7a1c48530ba03edb1afd1bb19455d894a62'
        '4beb7b3c4bfd3ba1c6e742f9198c5c03b0b95750d7aa24a31a2639b8d0adbcf2490663293df2e5cc5d1895eb9dcd34612e56704b9bab3a434475e29dc9eb275c'
        'd3162f81bfb927a9879c5629369ba8f13a45ba4fa8cfad78c5c40f6942de6b432e4eccacd156c792da7bf65ddf04292211d0c34f4db1cd51dba6765fde0ff917')
b2sums_aarch64=('593d36dbc3aa103e230fc8a2a7dc066264f3433cd1a4b0961af92de5c7d3fa1caf4a35367dd3110fe918de9714a931d7954e2e3987b874fa6b8266414d9c3211')
b2sums_x86_64=('7c77d8de59ca8329539b78b46f7a038459eb45500c1693a64040b3b3593542496245872319469e9327ce9b33032d2c2a47c1a97f08adea57f45ed267451aa12d')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -vDm644 "${_pkgsrc}-${_appstrings[APPEXE]}.6" \
    "${pkgdir}/usr/share/man/man6/${_appstrings[APPEXE]}.6"
  install -vDm644 "${_pkgsrc}-${_appstrings[APPVENDOR]}-save.xml" \
    "${pkgdir}/usr/share/mime/packages/${_appstrings[APPVENDOR]}-save.xml"
  install -vDm644 "${_pkgsrc}-${_appstrings[APPID]}.appdata.xml" \
    "${pkgdir}/usr/share/metainfo/${_appstrings[APPID]}.appdata.xml"
  install -vDm644 "${_pkgsrc}-${_appstrings[APPID]}.desktop" \
    "${pkgdir}/usr/share/applications/${_appstrings[APPID]}.desktop"
  install -vDm644 "${_pkgsrc}-application-vnd.${_appstrings[APPVENDOR]}.save.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/application-vnd.${_appstrings[APPVENDOR]}.save.svg"
  install -vDm644 "${_pkgsrc}-${_appstrings[APPVENDOR]}-${_appstrings[APPEXE]}.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appstrings[APPVENDOR]}-${_appstrings[APPEXE]}.svg"

  for _size in 16 32 48 256; do
    install -vDm644 "${_pkgsrc}-application-vnd.${_appstrings[APPVENDOR]}.save.${_size}x${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/mimetypes/application-vnd.${_appstrings[APPVENDOR]}.save.png"
    install -vDm644 "${_pkgsrc}-${_appstrings[APPVENDOR]}-${_appstrings[APPEXE]}.${_size}x${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${_appstrings[APPVENDOR]}-${_appstrings[APPEXE]}.png"
  done

  find "${pkgdir}/usr/share" -type f -exec \
    sed -e "s/@APPNAME@/${_appstrings[APPNAME]}/g" \
        -e "s/@APPCOMMENT@/${_appstrings[APPCOMMENT]}/g" \
        -e "s/@APPEXE@/${_appstrings[APPEXE]}/g" \
        -e "s/@APPID@/${_appstrings[APPID]}/g" \
        -e "s/@APPDATA@/${_appstrings[APPDATA]}/g" \
        -e "s/@APPVENDOR@/${_appstrings[APPVENDOR]}/g" \
        -e "s/@MANIFEST_DATE@/${_appstrings[MANIFEST_DATE]}/g" \
        -e "s/@DISPLAY_VERSION_MAJOR@/${_appstrings[DISPLAY_VERSION_MAJOR]}/g" \
        -e "s/@DISPLAY_VERSION_MINOR@/${_appstrings[DISPLAY_VERSION_MINOR]}/g" \
        -e "s/@BUILD_NUM@/${_appstrings[BUILD_NUM]}/g" \
        -i "{}" +
}
