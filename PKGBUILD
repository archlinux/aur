# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname=caps-log
pkgname=${_pkgname}-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A small, terminal-based journaling tool"
arch=('x86_64')
url="https://github.com/NikolaDucak/${_pkgname}"
license=('MIT')
depends=('boost-libs' 'libgit2')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${url}/raw/${pkgver}/README.md"
        "${url}/raw/${pkgver}/LICENCE")
source_x86_64=("${_pkgsrc}.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}-linux.tar.gz")
sha256sums=('2259205a6b50054f0ccdf9e282cdc8915599dcf47ce02d1110993c900f4785d5'
            '9fd4f46b0ba1940805ca00a8cb34c60ed94d646a99d3650b69c0a60004990e18')
sha256sums_x86_64=('e284eecb409620e224dfc031c77a9c44727e47fca32415ab90ab67488fac96ef')
backup=("~/.caps-log/config.ini")

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENCE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}