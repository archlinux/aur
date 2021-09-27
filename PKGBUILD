# Maintainer: Brodi <me@brodi.space>
_pkgname=aretext
pkgname=${_pkgname}-bin
pkgver=0.2.1
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

sha256sums_x86_64=("98f08153649b64a8d48e7f9e2baf53858b7b002ddfee0f2dcc60c1ecfbac91f9")
sha256sums_i686=("e09931ffa6de870683da93d1efcca782b1abef8b556a38acf8ca7d8defeed6c4")
sha256sums_aarch64=("69ea87f63c1a6c101508b4190cb0290a42ce58e20305558b78c64d013370dac4")

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
