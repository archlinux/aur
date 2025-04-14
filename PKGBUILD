# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=jooaf
_pkgname=thoth
_pkgexec=thoth
pkgname=${_pkgname}-bin
pkgver=0.1.82
pkgrel=1
pkgdesc='Terminal scratchpad inspired by the Heynote app'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgexec}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux-musl_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux-musl_arm64.tar.gz")
sha256sums=('c6a6aec122be3781408ad1c89b1dc150b5e0d4fa3d56242760d5c47f1fa6c4e6'
            'f540c75128eabe8f8332d40f48ab58f130e5a7687ca41cb4f7191beba01e2286')
sha256sums_x86_64=('d26f7df312d6a7246897dbef177d837b658c810fe472b262ac4e80036075585c')
sha256sums_aarch64=('f714e17be6bb5343f37e39d815a70dc03b473ceaa50a65bb39b3aee5d32257d0')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgexec}" "${pkgdir}/usr/bin/${_pkgexec}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
