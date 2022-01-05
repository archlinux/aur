# Maintainer: dreieck

_pkgname='universalpaperclips-colouruimod'
pkgname="${_pkgname}"
pkgver=20171015.1
pkgrel=2
pkgdesc='Addition to universalpaperclips which enables coloured higlight of several status values. Requires a patched version of Universal Paperclips that loads the UI mod script if it is present.'
arch=('any')
url='https://github.com/timophy/UniversalPaperclipsUIMod'
license=('custom:MIT')
makedepends=()
depends=('universalpaperclips-colouruimodready')
optdepends=()
provides=()
source=(
  'upc_uimod.js::https://timophy.github.io/scripts/upc_uimod.js'
  'upc_uimod_LICENSE.MIT.txt::https://raw.githubusercontent.com/timophy/UniversalPaperclipsUIMod/master/LICENSE'
)
sha256sums=(
  'd87e511826e9b94d5736686b7f22dc4e5032eb93e654abb5d7f584dc1e056cd9' # upc_uimod.js
  'ec17322d46d099285dcc157fcd53827df46f045f53c6ea0bc1574ac8426baccc' # upc_uimod_LICENSE.txt
)

package() {
  cd "${srcdir}"

  install -D -v -m644 'upc_uimod.js' "${pkgdir}/usr/lib/universalpaperclips/upc_uimod.js"

  install -D -v -m644 'upc_uimod_LICENSE.MIT.txt' "${pkgdir}/usr/share/licenses/${pkgname}/upc_uimod_LICENSE.MIT.txt"
}
