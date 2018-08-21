# Maintainer: Gergely Imreh <imrehg@gmail.com>
pkgname=('casefile')
pkgver=4.1.13.11516
_pkgver1=${pkgver%.*.*}
_pkgver2=${_pkgver1//.}
pkgrel=1
pkgdesc="Offline intelligence application, allowing analysts to examine links between offline data"
arch=('any')
license=('custom')
url="https://www.paterva.com/web7/buy/maltego-clients/casefile.php"
depends=('java-environment=8')
optdepends=('perl')
source=(https://www.paterva.com/malv${_pkgver2}/Maltego.v${pkgver}.deb)
sha256sums=('1c23119b81b30ff956fa48b7a590acda49a1b81b6c497c4036897042eee499aa')

package() {
 ar x "${srcdir}/Maltego.v${pkgver}.deb"
 tar -C "${pkgdir}" -xzf "${srcdir}/data.tar.gz"
 find "${pkgdir}" -name .DS_Store -delete
}
