# Maintainer: Koen Oostveen <koen at koenoostveen dot nl>
pkgname=jasm-bin
pkgver=0.7.0
pkgrel=1
pkgdesc='A JVM assembler for the modern age'
url='https://github.com/roscopeco/jasm'
license=('MIT')
arch=(any)
depends=(java-runtime=11 bash)
source=("https://github.com/roscopeco/jasm/releases/download/v${pkgver}/jasm-${pkgver}.tar.gz")
package() {
	cd "jasm-$pkgver"
        install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
	install -d "$pkgdir/usr/lib/jasm"
        install -d "$pkgdir/usr/bin"

        cp -r bin lib "$pkgdir/usr/lib/jasm"
        ln -s ../lib/jasm/bin/jasm "$pkgdir/usr/bin/jasm"
}
sha256sums=('069c1b35b9e01046d77907cffed90220ed02ebc0a07dbe44b21f46e62fade990')
