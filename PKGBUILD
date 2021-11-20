# Maintainer: Brodi <me@brodi.space>
_pkgname=aretext
pkgname=${_pkgname}-bin
pkgver=0.3.0
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

sha256sums_x86_64=("47aecca73c12b604e453aa857f74d50e3f7df92011503fb58b2ec41558258961")
sha256sums_i686=("1a5831ad8a529e466620fe8bb403d23a37f01daf5e80d2edbea72f941fd85c52")
sha256sums_aarch64=("54ecae993c51c5e7c32da634e2df9fc5200ca7d6725b0666038d9b839783f962")

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
