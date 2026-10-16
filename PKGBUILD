# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=n0-computer
_pkgname=dumbpipe
pkgname=${_pkgname}-bin
pkgver=0.40.0
pkgrel=1
pkgdesc='Unix pipes between devices'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT' 'Apache')
depends=('glibc')
makedepends=('tar')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('!strip')
source=("README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-MIT-${pkgver}::${_urlraw}/LICENSE-MIT"
        "LICENSE-APACHE-${pkgver}::${_urlraw}/LICENSE-APACHE")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${arch[0]}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${arch[1]}.tar.gz")
sha256sums=('27866d975f6c8f87a37eb495a1164a435e067901a4f7fdb258025be86ec238bc'
            'b801c8d677ef9701149e05cf98f28b82a56832dd67c94d96d36d25d063b1b353'
            '7ee92352fcac2b427c4754822087d0aeb3afc99951b71bd15cc4c2e5c61c1b60')
sha256sums_x86_64=('bce08ab425dbe2642f8e89ba7e0d8e910a2da36cca662e56f793054a69f68b30')
sha256sums_aarch64=('9b5797cdfeb3d4a91575e1a7696971eec9403e400121744c88891b8ecbf2d26f')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
