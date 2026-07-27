# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgexec=mdedup
_pkgauthor=kdeldycke
_pkgname=mail-deduplicate
pkgname=${_pkgname}-bin
pkgver=9.0.0
pkgrel=1
pkgdesc='CLI to deduplicate mails from mail boxes'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('GPL-2.0-or-later')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgexec}")
options=('!strip')
source=("LICENSE-${pkgver}::${_urlraw}/license"
        "README-${pkgver}.md::${_urlraw}/readme.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/changelog.md")
source_x86_64=("${_pkgexec}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgexec}-linux-x64.bin")
source_aarch64=("${_pkgexec}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgexec}-linux-arm64.bin")
sha256sums=('8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643'
            'c4db3385ff5e60e3f7bbd612cf6b8173312459a11bdf300788c6266c22cb5268'
            '7b807e5f95540ba6d12c2cd83348becebac278f40e04fa2f686362de59c7e687')
sha256sums_x86_64=('6a2620943ce7bd6b463eb08213e8407b0a51e11a92de8aa75f5352552f92d980')
sha256sums_aarch64=('6a2620943ce7bd6b463eb08213e8407b0a51e11a92de8aa75f5352552f92d980')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgexec}-${pkgver}" "${pkgdir}/usr/bin/${_pkgexec}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
