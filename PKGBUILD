# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=jnx
pkgver=1.4
pkgrel=1
pkgdesc="A Java Navtex marine weather receiver/converter"
arch=('any')
url="https://arachnoid.com/JNX/"
license=('GPL3')
depends=('java-runtime' 'bash')
source=("https://arachnoid.com/JNX/JNX.jar"
        "$pkgname.sh"
        "$pkgname.desktop"
        # icon file is extracted from https://arachnoid.com/JNX/JNX_source.tar.gz
        "JNX_icon.png")
sha256sums=('a9317d79ab76e3b760036dfcd5f4c0ccc87eb4073edeea51912c8499ea360934'
            'f72e101688a86e53fc23ac07a074ef67994515cb96ec90e647df1a94738d76c5'
            'ecbfa6047b4f0c92addec02d602e6aedf82f14208949e0c1f8763a68b766c136'
            '7f9fc8f7be5463ca713cfb79ef3e397446f40678ec1c83d27925758c087fd17c')

package() {
    install -Dm644 "$srcdir/JNX.jar" "$pkgdir/usr/share/java/$pkgname/JNX.jar"
    install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
    install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/JNX_icon.png" "$pkgdir/usr/share/pixmaps/jnx.png"
}
