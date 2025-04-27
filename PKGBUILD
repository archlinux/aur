# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=netheril96
_pkgname=securefs
pkgname=${_pkgname}-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A filesystem in userspace (FUSE) with transparent encryption and decryption"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

depends=('abseil-cpp' 'argon2' 'crypto++' 'fuse2' 'gcc-libs' 'glibc' 'protobuf' 'sqlite')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-release.zip"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE.md"
        "README-${pkgver}::${_urlraw}/README.md"
        "DESIGN-${pkgver}::${_urlraw}/docs/design.md"
        "USAGE-${pkgver}::${_urlraw}/docs/usage.md")

sha256sums=('68bcad8312f0ee82a8fb314eec5aca4dff3db50cf64e621ef7e4e3a10c305ae2'
            '4b4e85715ed4e80f60c002775c13c69386faffc84c60f59b5a2fc85ae3f432d1'
            '38dec83cd881018b69e0bb515c61a65c726bf6e9df199b95436b442c7927a7e0'
            'c8abf21a65d072f3493ef9ef19c2fbfb29ca43be386f7438d1fe72b7a7f5e31d'
            '79c5725a1bcf4e4febcbfbf1f1d77751ab12d4def4306fc6a9c30e0a44a14d63')


package() {
	cd "${srcdir}"

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "DESIGN-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/DESIGN.md"
	install -Dm644 "USAGE-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/USAGE.md"
}
