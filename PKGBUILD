# Maintainer: Aditya Sirish <aditya@saky.in>
pkgname=('procyon-decompiler')
pkgver=0.6.0
pkgrel=2
pkgdesc='A Java decompiler, inspired by ILSpy and Mono.Cecil'
arch=('any')
url='https://github.com/mstrobel/procyon'
license=('Apache')
depends=('java-runtime')
source=("https://github.com/mstrobel/procyon/releases/download/v${pkgver}/${pkgname}-${pkgver}.jar"
	"${pkgname}")
noextract=("${pkgname}-${pkgver}.jar")
sha256sums=('821da96012fc69244fa1ea298c90455ee4e021434bc796d3b9546ab24601b779'
            '5cd5d0354f8f88150c3c10c8f1a2496b447810a0beb9f642675156fa940e3acf')

package() {
  install -D ${pkgname} "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}-${pkgver}.jar" "$pkgdir/usr/share/java/${pkgname}/${pkgname}.jar"
}
