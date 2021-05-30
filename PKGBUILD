# Maintainer: Brodi <me@brodi.space>

_pkgname=aretext
pkgname=${_pkgname}-bin
pkgver=0.1.0
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

sha256sums_x86_64=('0e71930a172eb2353baf868898535b8d3fc3e88e1449ee25e69af8d13ef81b25')
sha256sums_i686=('5da097052a2727d9497be5dfe33d309e1978365928e6ce93459e8b108f14e5b3')
sha256sums_aarch64=('5d38ca55046becd933318740c1e51efb318e676dbb80cc750db27d7b56622612')

package() {
	case ${arch} in
     x86_64)
           echo "AMD64"
	   cd "${_pkgname}_${pkgver}_linux_amd64"
          ;;
     i386)
           cd "${_pkgname}_${pkgver}_linux_386"
          ;;
     aarch64)
           cd "${_pkgname}_${pkgver}_arm64"
          ;;
	esac
	
	install -Dm755 aretext "${pkgdir}/usr/bin/aretext"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
