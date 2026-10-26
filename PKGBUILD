# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgexec=mdedup
_pkgauthor=kdeldycke
_pkgname=mail-deduplicate
pkgname=${_pkgname}-bin
pkgver=9.4.0
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
            '33d690095d8e9fe33ad973bdbd78d674a933aeb853e37278781d452d7b12c0e6'
            '6efbd9050f74a72f4b1a931dd91a44b96d6535c030c4d693aed2d6a334507a70')
sha256sums_x86_64=('d2bdf9f91f2b8faa9127ea2bcadcd1b4b9a73738568df42f0b8be2a5ea432f15')
sha256sums_aarch64=('d2bdf9f91f2b8faa9127ea2bcadcd1b4b9a73738568df42f0b8be2a5ea432f15')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgexec}-${pkgver}" "${pkgdir}/usr/bin/${_pkgexec}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
