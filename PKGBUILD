# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=quarkus-agent-mcp-bin
pkgver=1.2.13 # datasource=github-releases depName=quarkusio/quarkus-agent-mcp
pkgrel=1
pkgdesc="A standalone MCP server that enables AI coding agents to create, manage, and interact with Quarkus applications."
arch=(any)
url="https://github.com/quarkusio/quarkus-agent-mcp"
license=('Apache-2.0')
depends=('java-runtime>=11')

source=(
	"${url}/releases/download/${pkgver}/quarkus-agent-mcp-${pkgver}-runner.jar"
	"LICENSE-${pkgver}::${url}/raw/refs/tags/${pkgver}/LICENSE"
)

sha256sums=('1245a9dd3cf6612237fa6d0ef7323d1b66e6ef4619e13fc28750df08d5df06b0'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

noextract=("quarkus-agent-mcp-${pkgver}-runner.jar")

package() {

	cd $srcdir

	install -Dm755 "quarkus-agent-mcp-${pkgver}-runner.jar" \
		"$pkgdir/usr/share/java/quarkus-agent-mcp/quarkus-agent-mcp-runner.jar"

	install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
