# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="dbxcli"
pkgname="${_pkgname}-bin"
pkgver=3.0.0
pkgrel=2
pkgdesc="A command line client for Dropbox built using the Go SDK"
arch=('armv7h' 'x86_64')
url="https://github.com/dropbox/${_pkgname}"
license=('Apache-2.0')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_armv7h=("${_pkgsrc}-armv7h::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
sha256sums=('a6352344b8f07d4504b3c750adfe3c1e1ed07b1a351362e80d0cd6761782f4c0'
            '0d70849e238c190dfcfac96d23d9808c2336cb1ba0550182311d7a496a9c313d')
sha256sums_armv7h=('806584e4758e59d753c1d7ed0fe97a7ae43fec0240c3bf4d388360bb51daf346')
sha256sums_x86_64=('3ff6e29675095063a5ba7101115cf7f809f3deddf14998ac61bf7a0330d736cb')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
