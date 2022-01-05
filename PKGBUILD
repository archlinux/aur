# Maintainer: dreieck

_use_upc_uimod=false # Set this to true in order to install a mod to the user interface which colour-highlights some values depending on their state.
# _use_upc_uimod=true

_pkgname='universalpaperclips'
pkgname="${_pkgname}"
pkgver=3
_cssver=2
#_cssver="${pkgver}"
pkgrel=12
pkgdesc='Clicker game where you control an AI whose aim is to create as many paperclips as possible. (To enable mods, edit flags in `PKGBUILD`.)'
arch=('any')
url='https://decisionproblem.com/paperclips/'
_downloadbase='https://decisionproblem.com/paperclips'
license=('custom:unknown')
makedepends=()
depends=('electron')
optdepends=(
  'optipng: [Only applicable at build time] shrink PNG images by lossless optimisation.'
)
source=(
  "index2.html::${_downloadbase}/index2.html"
  "main.js::${_downloadbase}/main.js?v${pkgver}"
  "globals.js::${_downloadbase}/globals.js?v${pkgver}"
  "projects.js::${_downloadbase}/projects.js?v${pkgver}"
  "combat.js::${_downloadbase}/combat.js?v${pkgver}"
  "interface.css::${_downloadbase}/interface.css?v${_cssver}"
  "mobile-title.png::${_downloadbase}/mobile-title.png"
  "test.mp3::${_downloadbase}/test.mp3"
  # "apple_badge.svg::${_downloadbase}/apple_badge.svg"   # Apple store badge not needed since we patch out links to external content.
  # "google_badge.svg::${_downloadbase}/google_badge.svg" # Google play store badge not needed since we patch out links to external content.
  "index.html::${_downloadbase}/index.html"
  "titlescreen.css::${_downloadbase}/titlescreen.css?v${_cssver}"
  "title.png::${_downloadbase}/title.png"
  "patch1notes.html::${_downloadbase}/patch1notes.html"
  "patch2notes.html::${_downloadbase}/patch2notes.html"
  'index2.01.html_remove-external-content.patch'
  'index2.02.html_reenable-threnody-music.patch'
  'index.01.html_remove-external-content.patch'
  'universalpaperclips.sh'
  'universalpaperclips.desktop'
  'game.url'
  'wikipedia.url'
  'reddit.url'
  'fandom.url'
  'license-dummy.txt'
)
sha256sums=(
  '0174dd761dadacb8eb8e5e6806b9b6a1cb24c65cba63092e9d39bd0944136214' # index2.html
  'ee599076de868869e533490505189ddcb72dcc8748909ceeebe11e789f1b3a0a' # main.js
  '968abd83c7090f24b6817842b4453b6d24de0e03e06d7ccb5ec4d15bee520919' # globals.js
  '05034c51809bc0632e8963e671c8e68c68604ca3643da291e0c6fabc86152774' # projects.js
  'c7226d012193c32a00bed53d7cb0119d4d3f91cb556b8e8d1b98dd3375be811a' # combat.js
  'ddb3078d0ec5499b12cc04680fdc1d157f2e5cc37ed1f4d6010ea5e16b5e88da' # interface.css
  '8eaaec8ec8f433ff1662d662b6da2557140efa50c3713e443ec12b1a605cc242' # mobile-title.png
  '9c952d68cbd27921c99e36f4816f61c07706b06d8257659d7c461a42eb4fc6f0' # test.mp3
  # 'a26fc5b38380272c92e9019a2eb8b45542a66814b3e2b203772db8904b9fb99f' # apple_badge.svg
  # '4225ff9706905f8cb4f0ae13e4385f0cc2083bb18c1a3128392ac5ee3e964ca8' # google_badge.svg
  '9c46561e47be72a88198247ce7f87e9739b0fe62955129c7541db082b48de2e1' # index.html
  '2bb9efb691f5608575ee6859b73e02daa92aa3427b02f852279c2f586bf587b4' # titlescreen.css
  'd2e6e499ffd04d1a5f9cdaf8742f251534f7d778fe6b730705d3cc00ab7bb419' # title.png
  '609a0df9258d0c8c13cc7e03653d2f63c1c26906697083d93f5f26a25545f0a1' # patch1notes.html
  'd678bf3318fd8c34d60a3657729ba0ae670ebea913cac1acaa3be722bb96cbb3' # patch2notes.html
  '4352425ef44c7c9f282c5d3919e2b320568dce1fb9d6744a6e561b4cc27aedcd' # index2.01.html_remove-external-content.patch
  '20ff4b35331294364354b35319795cc85c2266bfce991adcac8f72e17b8184e6' # index2.02.html_reenable-threnody-music.patch
  '55f7c5853e59a704361e5145aa25430427d4ab8ffabfff3637f2553b26e8f84c' # index.01.html_remove-external-content.patch
  'a8855bbb7c292c69df530ce7385064c457152dc264b22d157b08798fb9370480' # universalpaperclips.sh
  '2b73b90be3611eade8da7067fc9f563fab9fe5d85d03cf7201cdc224afd379e3' # universalpaperclips.desktop
  'dff62c22c922d977afedf53fe2a16cc766e5c3778608ac05897100e4baa5dc0e' # game.url
  '634e2a7d24697532904a1ec52a5d87b486f1f8055406c274394d7f220a64e9e7' # wikipedia.url
  '1c7a15533d5c5d97a541de91eaa8b33e014ea70fcd512b662fd8b70ba9ebf74a' # reddit.url
  'd95a022889ad1dbbf9175fc739c7a7e83b9396a83a28743d3904541e5f7376b7' # fandom.url
  '87a7e62b6e08f2491657fc8b0a0fe380a7dec3811e8d5ca36fe54d21f3548552' # license-dummy.txt
)

if "${_use_upc_uimod}"; then
  license+=('custom:MIT')
  source+=(
    'upc_uimod.js::https://timophy.github.io/scripts/upc_uimod.js'
    'upc_uimod_LICENSE.txt::https://raw.githubusercontent.com/timophy/UniversalPaperclipsUIMod/master/LICENSE'
    'index2.03.html_add-uimod-by-timophy.patch'
  )
  sha256sums+=(
    'd87e511826e9b94d5736686b7f22dc4e5032eb93e654abb5d7f584dc1e056cd9' # upc_uimod.js
    'ec17322d46d099285dcc157fcd53827df46f045f53c6ea0bc1574ac8426baccc' # upc_uimod_LICENSE.txt
    'fcb518acc415c5d05d54dd8afb75e4be7727161f026a37e6c92b4b18a700fcd1' # index2.03.html_add-uimod-by-timophy.patch
  )
fi

prepare() {
  mkdir -p "${srcdir}/patched"
  cp "${srcdir}/index.html"       "${srcdir}/patched/index.html"
  cp "${srcdir}/index2.html"      "${srcdir}/patched/index2.html"
  cp "${srcdir}/mobile-title.png" "${srcdir}/patched/mobile-title.png"
  cp "${srcdir}/title.png"        "${srcdir}/patched/title.png"

  cd "${srcdir}/patched"

  msg2 "Applying patches to remove external links ..."
  patch -N -i "${srcdir}/index2.01.html_remove-external-content.patch" "index2.html"
  patch -N -i "${srcdir}/index.01.html_remove-external-content.patch"  "index.html"

  msg2 "Applying patch to re-enable threnody music ..."
  patch -N -i "${srcdir}/index2.02.html_reenable-threnody-music.patch" "index2.html"

  if "${_use_upc_uimod}"; then
    msg2 "Applying patch to mod the UI to colour-highlight some status ..."
    patch -N -i "${srcdir}/index2.03.html_add-uimod-by-timophy.patch" "index2.html"
  fi
}

build() {
  cd "${srcdir}/patched"

  if which optipng > /dev/null 2>&1; then
    msg2 'Optimising PNG files for size ...'
    optipng -o7 'mobile-title.png'
    optipng -o7 'title.png'
  fi
}

package() {
  cd "${srcdir}"

  for _gamefile in 'patched/index2.html' 'main.js' 'globals.js' 'projects.js' 'combat.js' 'interface.css' 'patched/mobile-title.png' 'test.mp3' 'patched/index.html' 'titlescreen.css' 'patched/title.png'; do
    install -D -v -m644 "${_gamefile}" "${pkgdir}/usr/lib/${_pkgname}/$(basename "${_gamefile}")"
  done
  ln -srv "${pkgdir}/usr/lib/${_pkgname}/index2.html" "${pkgdir}/usr/lib/${_pkgname}/universalpaperclips.html"
  ln -srv "${pkgdir}/usr/lib/${_pkgname}/index.html"  "${pkgdir}/usr/lib/${_pkgname}/start.html"
  ln -srv "${pkgdir}/usr/lib/${_pkgname}/mobile-title.png" "${pkgdir}/usr/lib/${_pkgname}/universalpaperclips.png"

  if "${_use_upc_uimod}"; then
    install -D -v -m644 'upc_uimod.js' "${pkgdir}/usr/lib/${_pkgname}/upc_uimod.js"
  fi

  install -D -v -m755 'universalpaperclips.sh' "${pkgdir}/usr/bin/universalpaperclips"

  install -d -v -m755 "${pkgdir}/usr/share/pixmaps"
  ln -srv "${pkgdir}/usr/lib/${_pkgname}/mobile-title.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

  install -D -v -m644 'universalpaperclips.desktop' "${pkgdir}/usr/share/applications/universalpaperclips.desktop"

  for _docfile in 'game.url' 'wikipedia.url' 'reddit.url' 'fandom.url'; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  for _changelog in 'patch1notes.html' 'patch2notes.html'; do
    install -D -v -m644 "${_changelog}" "${pkgdir}/usr/share/doc/${_pkgname}/changelog/${_changelog}"
  done

  install -D -v -m644 'license-dummy.txt' "${pkgdir}/usr/share/licenses/${pkgname}/license-dummy.txt"
  if "${_use_upc_uimod}"; then
    install -D -v -m644 'upc_uimod_LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/upc_uimod_LICENSE.MIT.txt"
  fi
}

