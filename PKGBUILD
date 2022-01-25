# Maintainer: Brodi <me@brodi.space>
_pkgname=aretext
pkgname=${_pkgname}-bin
pkgver=0.4.0
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

sha256sums_x86_64=("3b4c7e3f20b4beebcd69899d04b77dd440dc17f1168cf7a28e9a0393bf004046")
sha256sums_i686=("ef1f0b39bba6f1ea765ab51b1217bf8297d183d0426c257d6c3b59ccfb0f7bcf")
sha256sums_aarch64=("d57c2fbd9ccb884e428e69cec2fc93336cbe9b1ab1ba33049e20d6475f43befd")

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
