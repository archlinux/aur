# Maintainer: Gergely Imreh <imrehg@gmail.com>
pkgname=('casefile')
pkgver=4.2.3.12223
_pkgver1=${pkgver%.*}
_pkgver2=${_pkgver1//.}
pkgrel=1
pkgdesc="Offline intelligence application, allowing analysts to examine links between offline data"
arch=('any')
license=('custom')
url="https://www.paterva.com/web7/buy/maltego-clients/casefile.php"
depends=('java-environment=8')
optdepends=('perl')
source=(https://www.paterva.com/malv${_pkgver2}/Maltego.v${pkgver}.deb)
sha256sums=('747eaf663524f016546c7e1c8790124ff91b7f6d6a07442403c9d607f588f786')

package() {
 ar x "${srcdir}/Maltego.v${pkgver}.deb"
 tar -C "${pkgdir}" -xzf "${srcdir}/data.tar.gz"
 find "${pkgdir}" -name .DS_Store -delete
}
