# Maintainer: mxcynic <mx1545814198@gmail.com>

pkgname=mq-bin
_pkgname=mq
pkgver=0.6.0
pkgrel=1
pkgdesc='mq is a command-line tool that processes Markdown using a syntax similar to jq.'
arch=('x86_64')
url='https://github.com/harehare/mq'
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=('mq')
conflicts=('mq')

source_x86_64=(
  "${_pkgname}-${pkgver}-x86_64::https://github.com/harehare/mq/releases/download/v${pkgver}/mq-x86_64-unknown-linux-gnu"
)

source=(
  "LICENSE::https://raw.githubusercontent.com/harehare/mq/v${pkgver}/LICENSE"
)

sha256sums=('26d7095907aaa4e84c1cc79e37c5d6a5b19a939b378cda17baaaf84376cfd368')
sha256sums_x86_64=('6ae604d66cf69b2acf1448abe8c7c68494cc41bd25d2efc6c6404afb5cc5b71a')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/mq"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
