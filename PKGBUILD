# Maintainer: Brodi <me@brodi.space>
_pkgname=aretext
pkgname=${_pkgname}-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="[BETA] Minimalist text editor that never slows you down."
url="https://github.com/aretext/aretext"
license=(GPL3)
arch=('x86_64' 'i686' 'aarch64')
provides=("${_pkgname}" "${_pkgname}-git")
conflicts=("${_pkgname}" "${_pkgname}-git")

source_x86_64=("$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_i686=("$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=("d4873e28208a9c0a4ac7766233b08ea75d064b0f8de02420296d6bfbd4ea80ec")
sha256sums_i686=("cb8a016938326338156049edc680e8a2f4703faaf4bdf11e40012ead5ac718bf")
sha256sums_aarch64=("8a98a35cca5e5e5114155cbccf98a265ae77799ea09603e1c80b5cc1298c6c51")

package() {
	case ${arch} in
     x86_64)
	   cd "${_pkgname}_${pkgver}_linux_amd64"
          ;;
     i686)
           cd "${_pkgname}_${pkgver}_linux_386"
          ;;
     aarch64)
           cd "${_pkgname}_${pkgver}_arm64"
          ;;
	esac
	
	install -Dm755 aretext "${pkgdir}/usr/bin/aretext"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
