# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=n0-computer
_pkgname=sendme
pkgname=${_pkgname}-bin
pkgver=0.21.0
pkgrel=3
pkgdesc='A tool to send files and directories'
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
sha256sums=('744ac29212a7ce796a00d35d11c473490589e7326b9a5b5c05e6ba70a6b641f7'
            'b801c8d677ef9701149e05cf98f28b82a56832dd67c94d96d36d25d063b1b353'
            '7ee92352fcac2b427c4754822087d0aeb3afc99951b71bd15cc4c2e5c61c1b60')
sha256sums_x86_64=('f327f7bda373ae9e082d92a58f79ef9f03d8fd416ea8d10d9a64666c9917c240')
sha256sums_aarch64=('944a3f6190b4786078f988fc315470a070ed24cfcc0a45117775d13801a56ab7')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
