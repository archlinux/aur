# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: tee <teeaur at duck dot com>

_pkgauthor=cube2222
_pkgname=octosql
pkgname=${_pkgname}-bin
pkgver=0.13.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc='A CLI tool which lets you query a plethora of databases and file formats using SQL'
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[1]}.tar.gz")

sha256sums=('49ce50d9820bdddfc8389ebcd43410eb202cccbe6f2d5470fde62ff75e6b567b'
            '1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5')
sha256sums_x86_64=('49963463c2dc515bedd7e9d77e0e75a394532102ce878caa097250a8260aa815')
sha256sums_aarch64=('8455bc6f9f9164d4469b286bcb58921887e2fe9390e50195fa2f4ea45d85d235')

package() {
    cd "${srcdir}" || exit 1

    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
