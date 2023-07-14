# Maintainer: Nichlas Severinsen <ns@nsz.no>
pkgname=tusd-bin
_gitname='tusd'
provides=('tusd')
conflicts=('tusd')
pkgver=1.11.0
pkgrel=1
pkgdesc='Server implementation of tus in Go'
arch=('x86_64')
_archname='amd64'
license=('MIT')
url='https://tus.io'
install=tusd.install

source=(
  "tusd.service"
  "https://github.com/tus/${_gitname}/releases/download/v${pkgver}/${_gitname}_linux_${_archname}.tar.gz"
  "https://raw.githubusercontent.com/tus/tusd/master/LICENSE.txt"
)

sha256sums=(
  'a83378b969ef0f4ca7eba194704c4a53650a7015201cc9148003d4d1a9a0d671'
  '76dabcd71977e5ceed1d731ce7864bdd020f83ac503d8c974548b2927830f926'
  '6ffc8271ebdc9f41112f385e7a80ca0c5167650883c90c4727848f5dc291fb5c'
)

package() {
  install -Dm755 "${srcdir}/${_gitname}_linux_${_archname}/${_gitname}" "${pkgdir}/usr/bin/${_gitname}"
  install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
  install -Dm644 "${srcdir}/tusd.service" "${pkgdir}/usr/lib/systemd/system/tusd.service"
}
