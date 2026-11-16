# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=quarkus-agent-mcp-bin
pkgver=1.2.14 # datasource=github-releases depName=quarkusio/quarkus-agent-mcp
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

sha256sums=('6d6f08913add0726244027c75cb49cd99ae093611196b61c21cc8b0b167bc8b6'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

noextract=("quarkus-agent-mcp-${pkgver}-runner.jar")

package() {

	cd $srcdir

	install -Dm755 "quarkus-agent-mcp-${pkgver}-runner.jar" \
		"$pkgdir/usr/share/java/quarkus-agent-mcp/quarkus-agent-mcp-runner.jar"

	install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
