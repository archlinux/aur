# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgexec=mdedup
_pkgauthor=kdeldycke
_pkgname=mail-deduplicate
pkgname=${_pkgname}-bin
pkgver=9.5.0
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
            'faa8c709eb849e62150c61f6825e7ab51a7ee2fd5845c0549cd90ed460f2d22c'
            '57e8c118987be1df36bdb1cf59240581b59273f5f95e6e30e8dd2f0c0458b6cd')
sha256sums_x86_64=('1dd7f5e4e7eea69982d484b7666ed7ce5e11a66cef5112f5bd9458693400b2f5')
sha256sums_aarch64=('1dd7f5e4e7eea69982d484b7666ed7ce5e11a66cef5112f5bd9458693400b2f5')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgexec}-${pkgver}" "${pkgdir}/usr/bin/${_pkgexec}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
