# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname=dbxcli
pkgname=${_pkgname}-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="A command line client for Dropbox built using the Go SDK"
arch=('x86_64' 'arm')
url="https://github.com/dropbox/${_pkgname}"
license=('Apache')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${url}/raw/v${pkgver}/README.md"
        "${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
source_arm=("${_pkgsrc}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm")
sha256sums=('a6352344b8f07d4504b3c750adfe3c1e1ed07b1a351362e80d0cd6761782f4c0'
            '0d70849e238c190dfcfac96d23d9808c2336cb1ba0550182311d7a496a9c313d')
sha256sums_x86_64=('3ff6e29675095063a5ba7101115cf7f809f3deddf14998ac61bf7a0330d736cb')
sha256sums_arm=('806584e4758e59d753c1d7ed0fe97a7ae43fec0240c3bf4d388360bb51daf346')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}