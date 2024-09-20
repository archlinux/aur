# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=netheril96
_pkgname=securefs
pkgname=${_pkgname}-bin
pkgver=1.0.0
pkgrel=2
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

sha256sums=('a3456b7c5bf9e6eeeca48d938a2aa3f765b11115987c3ba0d246c842f72a5d6d'
            '4b4e85715ed4e80f60c002775c13c69386faffc84c60f59b5a2fc85ae3f432d1'
            '5d8ecbaf44c7193fe1dc6391f21722dd508b5166141cafba2a85b48e5685438e'
            'c8abf21a65d072f3493ef9ef19c2fbfb29ca43be386f7438d1fe72b7a7f5e31d'
            '265df775dccfa32fa27240f188ddf6ca97e8752d8dd27fdd7c59471234209567')


package() {
	cd "${srcdir}"

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "DESIGN-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/DESIGN.md"
	install -Dm644 "USAGE-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/USAGE.md"
}
