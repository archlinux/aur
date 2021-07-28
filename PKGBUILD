# maintainer: libele <libele@disroot.org>

pkgname=tweego
pkgver=2.1.1
pkgrel=1
pkgdesc="a command line compiler for Twine/Twee story formats, written in Go."
arch=('i686' 'x86_64')
url='https://www.motoslave.net/tweego'
license=('BSD' 'custom')
source_i686=("https://github.com/tmedwards/tweego/releases/download/v${pkgver}/tweego-${pkgver}-linux-x86.zip")
source_x86_64=("https://github.com/tmedwards/tweego/releases/download/v${pkgver}/tweego-${pkgver}-linux-x64.zip")
md5sums_i686=('99155762268a8b89868de8dfed3dcb0f')
md5sums_x86_64=('6ebec69142cc6aa9501b82b141da04cc')

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 tweego "${pkgdir}/usr/share/${pkgname}/${pkgname}"

  ln -s "/usr/share/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  cp -a storyformats "${pkgdir}/usr/share/${pkgname}/storyformats"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -a licenses "${pkgdir}/usr/share/licenses/${pkgname}"
}
