# Maintainer: Aditya Sirish <aditya@saky.in>
pkgname=('procyon-decompiler')
pkgver=0.6
pkgrel=1
pkgdesc='A Java decompiler, inspired by ILSpy and Mono.Cecil'
arch=('any')
url='https://github.com/mstrobel/procyon'
license=('Apache')
depends=('java-runtime')
source=("https://github.com/mstrobel/procyon/releases/download/${pkgver}-prerelease/${pkgname}-${pkgver}-prerelease.jar"
	"${pkgname}")
noextract=("${pkgname}-${pkgver}-prerelease.jar")
sha256sums=('781556282a3c71c013fd3f47823c5408d1731b2ce87dcf4c6f2a7495d526add9'
            '5cd5d0354f8f88150c3c10c8f1a2496b447810a0beb9f642675156fa940e3acf')

package() {
  install -D ${pkgname} "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}-${pkgver}-prerelease.jar" "$pkgdir/usr/share/java/${pkgname}/${pkgname}.jar"
}
