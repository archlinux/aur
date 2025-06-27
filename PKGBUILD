# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=n0-computer
_pkgname=dumbpipe
pkgname=${_pkgname}-bin
pkgver=0.28.0
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
sha256sums=('3f60963b6e0a4825f53e77100681bf082a317e9bb8e61e1f2aae74bce10bcc7c'
            'b801c8d677ef9701149e05cf98f28b82a56832dd67c94d96d36d25d063b1b353'
            '7ee92352fcac2b427c4754822087d0aeb3afc99951b71bd15cc4c2e5c61c1b60')
sha256sums_x86_64=('7d9917a9ca0caef812e8d022584b40fc3b15fd20992d4fc3023c4393f0fe9c9e')
sha256sums_aarch64=('b793729ce2718b41d06d7ba78bf63682cb3313d51329da87db2c1250c779af12')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
