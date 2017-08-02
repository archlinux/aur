# Maintainer: crasm <crasm@fim.email.vczf.io>
pkgname='fim-cli'
pkgver=1.2.3
pkgrel=1
pkgdesc="Fim manages the integrity of a complete file tree"
arch=('any')
url="https://evrignaud.github.io/fim"
license=('GPL3')
depends=('java-runtime>=8'
         'sh')
conflicts=('fim')
source=("https://github.com/evrignaud/fim/releases/download/$pkgver/fim-$pkgver-distribution.tar.gz"
        "launcher.sh")
sha512sums=('7969f1b4b7e50c5ebf647bc5e5f296f0801d5a7844d8807b114602d70c64a238acaa847c5201466f6027a034eac2b6508a48260a4c2b5138475e34c54602b1a5'
            'a9e85412436cdef7a7d55e5d83731204bf97e3193f4600f4bd3543f89667597f95583a56e0d8bbbb8b90ec6d36fa3eed6ee238ee199e45681de5f6e45470d48f')

package() {
	install -m 755 -D "./launcher.sh" "${pkgdir}/usr/bin/fim"
	install -m 644 -D "./bin/fim-${pkgver}.jar" "${pkgdir}/usr/lib/fim/fim.jar"
	install -m 755 -d css/ images/ slides/ "${pkgdir}/usr/share/doc/fim/"
	install -m 644 -D *.html "${pkgdir}/usr/share/doc/fim/"
}
