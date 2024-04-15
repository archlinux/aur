# Maintainer: Luke Cotton <aur at cotton dot org dot uk>
_pkgname='unbted'
pkgname="${_pkgname}-bin"
pkgver=1.2.1
_pkgjar="${_pkgname}-${pkgver}.jar"
pkgrel=1
pkgdesc="Una's NBT Editor - an advanced interactive command-line NBT editor"
arch=('any')
url="https://github.com/unascribed/${_pkgname}"
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
	'762410caa82174abd4ef37ced4877f03bf3bc27742e07c23c1d27137d2484a38'
	'061cfaf442065b272b5ec464384c422d30b9d0473ddd2e33c205b9f620a3bca4'
	'cb16a84414fc7cccb56fd95cf3215f6c574ce9e921cbb4f270b313e3392e7a0f'
)


package () {
	depends=('java-runtime' 'sh')

	install -Dm755 $_pkgname "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 $_pkgjar "${pkgdir}/usr/share/java/${pkgname}/${_pkgname}.jar"
	install -Dm644 'opennbt-LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
}

