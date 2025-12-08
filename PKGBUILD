# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=rakyll
_pkgname=hey
pkgname=${_pkgname}-bin
pkgver=0.1.4
pkgrel=2
pkgdesc='HTTP load generator, ApacheBench (ab) replacement'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('Apache')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}::https://hey-release.s3.us-east-2.amazonaws.com/hey_linux_amd64")
sha256sums=('d0bc204f82616d966e412365cc98afa1a8a9a15be07614e4770e84295e7e83ef'
            'fc9a136c6c40bfe2ea4a6237e28efde05c96e574361a4ed4e8d33c7499c1e215')
sha256sums_x86_64=('e8d775962833c04940686a3310963341e26de171034fa7a7c934a5ccba4b02c2')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
