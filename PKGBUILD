# Maintainer: Nicolas Hureau <archlinux@kalenz.net>
pkgname=jadx
pkgver=0.6.0
pkgrel=2
pkgdesc="Command line and GUI tools to produce Java source code from Android Dex and APK files"
arch=(any)
url="https://github.com/skylot/jadx"
license=('Apache')
depends=('java-environment')
source=(https://github.com/skylot/jadx/releases/download/v$pkgver/$pkgname-$pkgver.zip)
sha256sums=('0baa680c8bb4f1c49b6d8b94b3947b8fedf263b5a0c20d3b38da35b57b857228')

package() {
    cd "$srcdir"

    mkdir -p "$pkgdir/opt/jadx/bin"
    install -Dm0755 bin/jadx "$pkgdir/opt/jadx/bin/jadx"
    install -Dm0755 bin/jadx-gui "$pkgdir/opt/jadx/bin/jadx-gui"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/jadx/bin/jadx "$pkgdir/usr/bin/jadx"
    ln -s /opt/jadx/bin/jadx-gui "$pkgdir/usr/bin/jadx-gui"

    mkdir -p "$pkgdir/opt/jadx/lib"
    install -Dm644 lib/android-5.1.jar "$pkgdir/opt/jadx/lib/android-5.1.jar"
    install -Dm644 lib/annotations-12.0.jar "$pkgdir/opt/jadx/lib/annotations-12.0.jar"
    install -Dm644 lib/asm-5.0.3.jar "$pkgdir/opt/jadx/lib/asm-5.0.3.jar"
    install -Dm644 lib/commons-io-2.4.jar "$pkgdir/opt/jadx/lib/commons-io-2.4.jar"
    install -Dm644 lib/dx-1.10.jar "$pkgdir/opt/jadx/lib/dx-1.10.jar"
    install -Dm644 lib/gson-2.3.1.jar "$pkgdir/opt/jadx/lib/gson-2.3.1.jar"
    install -Dm644 lib/jadx-cli-${pkgver}.jar "$pkgdir/opt/jadx/lib/jadx-cli-${pkgver}.jar"
    install -Dm644 lib/jadx-gui-${pkgver}.jar "$pkgdir/opt/jadx/lib/jadx-gui-${pkgver}.jar"
    install -Dm644 lib/jadx-core-${pkgver}.jar "$pkgdir/opt/jadx/lib/jadx-core-${pkgver}.jar"
    install -Dm644 lib/jcommander-1.47.jar "$pkgdir/opt/jadx/lib/jcommander-1.47.jar"
    install -Dm644 lib/jfontchooser-1.0.5.jar "$pkgdir/opt/jadx/lib/jfontchooser-1.0.5.jar"
    install -Dm644 lib/logback-classic-1.1.2.jar "$pkgdir/opt/jadx/lib/logback-classic-1.1.2.jar"
    install -Dm644 lib/logback-core-1.1.2.jar "$pkgdir/opt/jadx/lib/logback-core-1.1.2.jar"
    install -Dm644 lib/rsyntaxtextarea-2.5.6.jar "$pkgdir/opt/jadx/lib/rsyntaxtextarea-2.5.6.jar"
    install -Dm644 lib/slf4j-api-1.7.10.jar "$pkgdir/opt/jadx/lib/slf4j-api-1.7.10.jar"

    install -Dm644 LICENSE "$pkgdir/opt/jadx/LICENSE"
    install -Dm644 NOTICE "$pkgdir/opt/jadx/NOTICE"
    install -Dm644 README.md "$pkgdir/opt/jadx/README.md"
}
