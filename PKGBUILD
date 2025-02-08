# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=adamperkowski
_pkgname=nvrs
pkgname=${_pkgname}-bin
pkgver=0.1.7
pkgrel=3
pkgdesc='Fast new version checker for software releases'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "MAN-${pkgver}.1::${_urlraw}/man/nvrs.1"
        "SAMPLE-${pkgver}.toml::${_urlraw}/nvrs.toml")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}")
sha256sums=('bb2c11173575eba3c7e3ea9ed6bf136c9773356821ffe00cb592847a85326e67'
            'b0048686f7ec4c4c59007400ff8034de9c383c2b182d70d30b3bca114128dd27'
            '9be160c464c7035560a79d26fbe4e4f4e1460bc82305605826dea0ca48b83a8a'
            '7202b629a94fd67c6ce3e44385b67aefb4817782a6b146bbfc7471b4a037d1d5')
sha256sums_x86_64=('2880c5b9cd2c6ee5109caea3242a338f012eb6cdbf9550c6ce60dd4694b08a30')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "MAN-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  gzip "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

  install -Dm644 "SAMPLE-${pkgver}.toml" "${pkgdir}//usr/share/doc/${pkgname}/sample.${_pkgname}.toml"
}
