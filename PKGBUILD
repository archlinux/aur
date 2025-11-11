# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=Zen
_pkgauthor=ZenPrivacy
_pkgname=zen-desktop
pkgname=${_pkgname}-bin
pkgver=0.15.4
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Simple, free and efficient ad-blocker and privacy guard"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('glibc' 'gtk3' 'glib2' 'libsoup3' 'gdk-pixbuf2' 'webkit2gtk-4.1')
provides=("${_appname,,}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "SECURITY-${pkgver}.md::${_urlraw}/SECURITY.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}_linux_${_barch[0]}_noselfupdate.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}_linux_${_barch[1]}_noselfupdate.tar.gz")
sha256sums=('380166a3d43d12796e0039b32270991102469ad56ac77fb01ce675022ef6de02'
            '88910f0d9d6855ee4fbf00a74194b1f17f1193e6ac1e2ad6cbfc724e64e878e7'
            '0bd41715a89646c7600b043334d5c289eb463bd7fca7b03d8dbf082a90714e28'
            '527dcf8db889ff0b8cb5fa9b40ddac351e3ac7281014e241c3023fc45a1749a3')
sha256sums_x86_64=('185c096ffa63d42a3029a6a248de00786bcad9f85e5a8a31a2a070af219b3734')
sha256sums_aarch64=('1b3cdbcfaf5e0a8f495522bc7d8ae78651a64e35e3615e1ba254adf0061db49b')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname,,}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "SECURITY-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
