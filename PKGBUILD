# Maintainer: Brodi <me@brodi.space>
_pkgname=aretext
pkgname=${_pkgname}-bin
pkgver=0.7.0
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

sha256sums_x86_64=("2b9ada5bd912d2d87289fedcb2eb42aab4093a03c1902727e6b5a906dcf63f61")
sha256sums_i686=("210428ee5ace96b383785f63f4fd7d5b315d10ce2a2e6c14ab00544f8bc44ff4")
sha256sums_aarch64=("ec61798200ae6aa185425bde21882d75925d427bb0042e351fe133c6bdd1c63d")

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
