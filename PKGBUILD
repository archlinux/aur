# Maintainer: oldkingOK <oldkingok.creeper@gmail.com>
pkgname=jbytemod
pkgver=2.9.0
pkgrel=1
pkgdesc="Modern Java ByteCode Editor, supporting jars and apks"
arch=('any')
url="https://github.com/apkreader/JByteMod-Remastered"
license=('MIT')
depends=('jre21-openjdk')
_jar_main="JByteMod-Remastered-${pkgver}.jar"
noextract=("${_jar_main}")
source=("${url}/releases/download/${pkgver}/${_jar_main}")
sha256sums=('fd9916fc3b8bcb2d36a2b93b6ab1e3c7e6d20842967556ff336bee1ae31a619e')

package() {
    install -Dm644 "${_jar_main}" "$pkgdir/usr/share/${pkgname}/${_jar_main}"
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/${pkgname}" << END
#!/usr/bin/env sh
exec java -jar /usr/share/${pkgname}/${_jar_main} "\$@"
END
}
