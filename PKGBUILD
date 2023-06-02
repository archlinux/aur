# Maintainer: Andrey Antonowycz <andrey at antonowycz dot com>
pkgname=modest-toolset
pkgver=3.1.235_ge57b05e4a
pkgrel=3
pkgdesc="Toolset for modelling and analysis of hybrid, real-time, distributed and stochastic systems"
arch=('x86_64')
url="https://www.modestchecker.net"
options=(!strip)
license=('custom')
source=(LICENSE CHANGELOG)
source_x86_64=("https://www.modestchecker.net/Downloads/Modest-Toolset-v${pkgver//_/-}-linux-x64.zip")
optdepends=('graphviz: graphviz dot in Visual Studio Code extension')
sha256sums=('72ecf41ec7ac13ac1b84854777506a87971b5d511e30e6936f3ce04ecd7847f9' 'cbf39fa0e46be19445f6e43163cc6c08f256f2853f4e8a7e1eaa84d62225266f')
sha256sums_x86_64=('7024dbe2584506901fcec81bcb4d95c434173289cd8a9e574880aec2ad8ac0bc')

package() {
	install -dm755 "${pkgdir}/opt"
	cp -r "Modest" "${pkgdir}/opt/modest"
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/modest/modest" "${pkgdir}/usr/bin/modest"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 CHANGELOG "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"
}
