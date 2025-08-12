# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=fioncat
_pkgname=roxide
pkgname=${_pkgname}-bin
pkgver=0.18.3
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
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.tar.gz")

sha256sums=('6c11555712cc16c10cbfe648dd9896a33e86d0bed31d629e77f5f5a11a4dd92f'
            'c7dc85e2deab624457e3f411dd0e6eb9531611c4a11e3028c38e02999f27d94d')
sha256sums_x86_64=('96f5e97daf76848c391e6c9d822c7c260f341d12dd95281f86c8212bbeadf08b')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
