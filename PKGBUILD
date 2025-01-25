# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=purpleclay
_pkgname=gpg-import
pkgname=${_pkgname}-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='Easily import a GPG key within any CI workflow'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('adac0c3986955673a9d78f369a43d734013c8028a05a4082bd617b6d378b6fe6'
            '5d8e8c907ae676c257b7f17ac421c2099a40ad4a7b94003e36da754d687667a7')
sha256sums_x86_64=('e504cf1ff9e33241569ea4a6aded5a6216a3bd5ff14dd8576c3d25551a403275')
sha256sums_aarch64=('805fa3f34dd2ec4f2a1edd4c286474caf4eb05111d41039e47e17cef66c349d4')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
