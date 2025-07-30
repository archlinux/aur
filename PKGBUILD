# Maintainer: Richard Lees <git zero at bitservices dot io>
################################################################################

_parent=bicep
_name="${_parent}-langserver"

################################################################################

pkgname="${_name}-bin"
pkgver=0.36.177
pkgrel=1
pkgdesc="Provides Language Server Protocol (LSP) for Bicep."
arch=('any')
url="https://github.com/Azure/${_parent}"
license=('MIT')
depends=('dotnet-runtime>=8.0.0')
makedepends=('unzip')
provides=("${_name}=${pkgver}")
conflicts=("${_name}")
source=("${url}/releases/download/v${pkgver}/${_name}.zip"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/Azure/${_parent}/v${pkgver}/LICENSE")
noextract=("${_name}.zip")
sha256sums=("d96fe14467caa3b72f46fdd20d155edcf7799d56addfa42b0b7ae3380ab148dc"
            "c2cfccb812fe482101a8f04597dfc5a9991a6b2748266c47ac91b6a5aae15383")
options=('!strip')

################################################################################

package() {
  install -d "${pkgdir}/opt/${_name}"

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_name}/LICENSE"

  unzip -d "${pkgdir}/opt/${_name}" ./"${_name}.zip"
}

################################################################################

