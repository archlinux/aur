# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=fioncat
_pkgname=roxide
pkgname=${_pkgname}-bin
pkgver=0.20.5
pkgrel=1
pkgdesc="Manage your git repositories"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')

provides=("${_pkgname}")
depends=('glibc' 'git' 'fzf')
conflicts=("${_pkgname}" "${_pkgname}-release")

source=("README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}-unknown-linux-gnu.tar.gz")

sha256sums=('1c45e0ffc1f086e11c0b0afb9b952530966db3ca7987d9935292c5ffa49d3200'
            'c7dc85e2deab624457e3f411dd0e6eb9531611c4a11e3028c38e02999f27d94d')
sha256sums_x86_64=('24bd974398e4d898bdeede5b206c83370f6816c8782be2a909d79a162602df70')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
