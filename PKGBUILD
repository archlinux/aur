# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=shenwei356
_pkgname=brename
pkgname=${_pkgname}-bin
pkgver=2.14.0
pkgrel=2
pkgdesc='A practical cross-platform command-line tool for safely batch renaming files/directories via regular expression'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64.tar.gz")
sha256sums=('f9e68922f8df986308a5b2ca519f58be740bc885bbd1fc71dc53c348d20f7f5b'
            'f3c7db2e48e9bde683be6e7c0969b1a012e09af0751ec96c5d8be476cba885b9'
            '9376b08733dcf9cebe2219d9c286715b85b8fbb2b1b27298554a33e7fabcc6c6')
sha256sums_x86_64=('969635a953727c4009728b24deee3b488b002694ff8298b0228489b34ad10e5c')
sha256sums_i686=('203939277429887d4fc14444cc3776095ca920cef3440119be52dc23436d21f4')
sha256sums_aarch64=('91b96b99b42e4574950b753c9b1585b47ef4ca6c1c4dc4112c54ceaa1719ffd6')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
