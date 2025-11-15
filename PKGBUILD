# Maintainer: Luke Cotton <aur at cotton dot org dot uk>
_pkgname='unbted'
pkgname="${_pkgname}-bin"
pkgver=1.2.2
_pkgjar="${_pkgname}-${pkgver}.jar"
pkgrel=1
pkgdesc="Una's NBT Editor - an advanced interactive command-line NBT editor"
arch=('any')
url="https://git.sleeping.town/unascribed/${_pkgname}"
license=('GPL-3.0-only' 'Apache-2.0' 'MIT')
depends=()
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
source=(
	"${url}/releases/download/v${pkgver}/${_pkgjar}"
	"${_pkgname}"
	"opennbt-LICENSE"
)
noextract=($_pkgjar)
sha256sums=(
        '45210e41636a720542bd51d77e1426255688a0b30d2ac65301030db5cf560983'
        'f9388b1abf35d4709e135beaa582b095aa9e855b28c8767830917902be5d75ab'
        'cb16a84414fc7cccb56fd95cf3215f6c574ce9e921cbb4f270b313e3392e7a0f'
)


package () {
	depends=('java-runtime' 'sh')

	install -Dm755 $_pkgname "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 $_pkgjar "${pkgdir}/usr/share/java/${pkgname}/${_pkgname}.jar"
	install -Dm644 'opennbt-LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
}

