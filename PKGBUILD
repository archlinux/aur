# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=golang-glide-bin
_pkgname=glide
pkgdesc='Deprecated dependency management and vendoring for Go projects'
pkgver=0.13.3
pkgrel=3
arch=('x86_64')
url="https://github.com/Masterminds/${_pkgname}"
license=('MIT')
depends=('go')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=('glide' 'glide-bin' "${pkgname%-bin}")
replaces=('glide-bin')
options=('!strip')
source=("${pkgname}-v${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
b2sums=('78563a6894d8bf4adce3458cc7ecc4b64137eeecec92db3853f3cdb5586aa277618b9cd9bff7074734a5981b598d559b34c30c2c18c58cc3b47026b362077939')

package() {
  pushd "$srcdir/linux-amd64"
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  popd
}
