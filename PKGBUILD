# Maintainer: Uwe Koloska <kolewu@koloro.de>

_appname=sieve-app
pkgname=${_appname}-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Sieve script editor app version"
arch=('x86_64')
url="https://github.com/thsmi/sieve/"
license=('AGPL-3.0')

source=("https://github.com/thsmi/sieve/releases/download/${pkgver}/sieve-${pkgver}-linux-x64.zip"
		"${_appname}.desktop")
sha256sums=('8b146c4681d6395c146d20e6337db6ad58d098bf6621b7c79d48cc81d7c82abe'
            'cdd12628fcd3ff6d23cbb746e6cbdacc441fc93ed223796ef6db144b152f14a1')
noextract=("sieve-${pkgver}-linux-x64.zip")

package() {
  install -d -m0755 "${pkgdir}/"{opt/"${_appname}",usr/bin}
  unzip -d "${pkgdir}/opt/${_appname}" "sieve-${pkgver}-linux-x64.zip"
  chmod -R o+rX "${pkgdir}/opt/${_appname}"
  ln -s "/opt/${_appname}/sieve" "${pkgdir}/usr/bin/sieve"
  install -D -m0644 "${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
}
