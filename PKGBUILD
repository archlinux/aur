# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=j178
_pkgname=prek
pkgname=${_pkgname}-bin
pkgver=0.2.29
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="⚡ Better 'pre-commit', re-engineered in Rust"
arch=('x86_64' 'i686' 'aarch64')
_barch=('x86_64' 'i686' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gcc-libs' 'glibc')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "SECURITY-${pkgver}.md::${_urlraw}/SECURITY.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}-unknown-linux-gnu.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[2]}-unknown-linux-gnu.tar.gz")
sha256sums=('08215c44c901c7edf78c3a2b1e02558b0646a3ffa8161be0c112acfd3fb0c100'
            'c5806a084c71363df5e41438fc5d0633906f55d81257669ed92aeac6ec199e26'
            '1a5a6b20a64f17ed68c1ddb9fe0a52ef5830e91d8c4a32c77cfb7a68c1a6bd9f'
            '1cc10b31e014f93c6b55d6b1042f9955bb615ce3dac73379e3a106f49fa3a561')
sha256sums_x86_64=('c67531f43a84f7c1c1eb6618ffc5244c46377a1996cb42bbc69feda5a921b469')
sha256sums_i686=('64ef9f913791f20bbc589db7dabc8ef1b5874e97d4f77d201688034dd3ee969b')
sha256sums_aarch64=('c0722f6a17e3ca528359fe0f7ebb39be2c3aec568e97fe0ec7a58af024b3ce0a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-unknown-linux-gnu/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "SECURITY-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
