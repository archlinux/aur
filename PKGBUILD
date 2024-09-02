# Maintainer: Richard Lees <git zero at bitservices dot io>
################################################################################

_parent=bicep
_name="${_parent}-langserver"

################################################################################

pkgname="${_name}-bin"
pkgver=0.29.47
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
sha256sums=("c219e18a6ea116ecdaf55ddd7e311bba2f55fc358ef7139070b9ef839656523d"
            "c2cfccb812fe482101a8f04597dfc5a9991a6b2748266c47ac91b6a5aae15383")
options=('!strip')

################################################################################

package() {
  install -d "${pkgdir}/opt/${_name}"

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_name}/LICENSE"

  unzip -d "${pkgdir}/opt/${_name}" ./"${_name}.zip"
}

################################################################################

