# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=netheril96
_pkgname=securefs
pkgname=${_pkgname}-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="A filesystem in userspace (FUSE) with transparent encryption and decryption"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

depends=('abseil-cpp' 'argon2' 'crypto++' 'fuse2' 'gcc-libs' 'glibc' 'protobuf' 'sqlite')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-release.zip"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE.md"
        "README-${pkgver}::${_urlraw}/README.md"
        "LONG-NAME-${pkgver}::${_urlraw}/docs/long_name.md"
        "DESIGN-${pkgver}::${_urlraw}/docs/design.md"
        "USAGE-${pkgver}::${_urlraw}/docs/usage.md")

sha256sums=('ebb8fbe8fec36b51c8c8edde12bf4fb45d1a289f3f08c196ee29f6d5c1bdc2c2'
            '4b4e85715ed4e80f60c002775c13c69386faffc84c60f59b5a2fc85ae3f432d1'
            'a662a948b2b5f2f6ee9ff05e6018f3ba73fb91ba5e31609a9264ed596f2c2ae0'
            '63a5b191613a3e341c9181e12c9655f791916e4189eddc2cf036e05212c66919'
            'c8abf21a65d072f3493ef9ef19c2fbfb29ca43be386f7438d1fe72b7a7f5e31d'
            'f5e0a336df7b549c091213c085d4457fae26beeb86133eeb85182b595a0bcf29')


package() {
	cd "${srcdir}"

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"

	install -Dm644 "LONG-NAME-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/LONG-NAME.md"
	install -Dm644 "DESIGN-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/DESIGN.md"
	install -Dm644 "USAGE-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/USAGE.md"
}
