# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=purpleclay
_pkgname=nsv
pkgname=${_pkgname}-bin
pkgver=0.12.1
pkgrel=1
pkgdesc='No-config semantic versioning'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums=('adac0c3986955673a9d78f369a43d734013c8028a05a4082bd617b6d378b6fe6'
            '95f8ae76e30c380462aa7c639c78b5b37062a01eb7a6d69ba9b07366f30b446a')
sha256sums_x86_64=('7e0be0596d7260b82b0fbbe5fbb4f02b2d2ebb7c1fec3a3bce247096c3e00284')
sha256sums_aarch64=('2ceb631efc96d8830e663592c79e4ad07a50ef646584e821f448fb278c156dd2')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
