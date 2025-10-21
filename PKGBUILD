# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=purpleclay
_pkgname=gpg-import
pkgname=${_pkgname}-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='Easily import a GPG key within any CI workflow'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')

depends=('glibc' 'gcc-libs')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${arch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('adac0c3986955673a9d78f369a43d734013c8028a05a4082bd617b6d378b6fe6'
            '282ec344a0101fbe1dbcd026c28f2e727547c2819aad6e035cb1e81d401d7b25')
sha256sums_x86_64=('052c2ba11a9326bc6d38d7e4b87c096f9e7e96eaa01ff93259e7a70a7299001c')
sha256sums_aarch64=('0196451f0c44e5d1d933901991254919fca10a349b64c40297443d01bd60dfb2')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
