# Maintainer: Gergely Imreh <imrehg@gmail.com>
pkgname=('casefile')
pkgver=4.2.6.12502
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
md5sums=('7400f0e8fba47b7fdf8bc2b4a9d23714')
sha256sums=('cd127ad57deb603ec181ae367b194d0e312dc1be912d933a24398c6ac9832947')

package() {
 ar x "${srcdir}/Maltego.v${pkgver}.deb"
 tar -C "${pkgdir}" -xzf "${srcdir}/data.tar.gz"
 find "${pkgdir}" -name .DS_Store -delete
}
