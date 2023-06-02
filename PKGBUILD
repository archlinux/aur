# Maintainer: Andrey Antonowycz <andrey at antonowycz dot com>
pkgname=modest-toolset
pkgver=3.1.235_ge57b05e4a
pkgrel=1
pkgsec="Toolset for modelling and analysis of hybrid, real-time, distributed and stochastic systems"
arch=('x86_64')
url="https://www.modestchecker.net"
options=(!strip)
license=('custom')
source=(LICENSE)
source_x86_64=("https://www.modestchecker.net/Downloads/Modest-Toolset-v${pkgver//_/-}-linux-x64.zip")
optdepends=('graphviz: graphviz dot in Visual Studio Code extension')
sha256sums=('2a7f81d26a98a73826766fafc2dcf03fa3d74576e3aee572f61e772dd7e2d1e9')
sha256sums_x86_64=('7024dbe2584506901fcec81bcb4d95c434173289cd8a9e574880aec2ad8ac0bc')

package() {
	install -dm755 "${pkgdir}/opt"
	cp -r "Modest" "${pkgdir}/opt/modest"
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/modest/modest" "${pkgdir}/usr/bin/modest"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
