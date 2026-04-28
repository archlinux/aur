# Maintainer: Koen Oostveen <koen at koenoostveen.nl>
pkgname=enigma-bin
pkgver=4.0.2
pkgrel=1
pkgdesc='A deobfuscation/remapping tool for Java software.'
arch=(any)
url='https://github.com/FabricMC/Enigma'
license=('LGPL-3.0-or-later')
depends=(bash java-runtime=17)
makedepends=(gettext)
source=("https://maven.fabricmc.net/cuchaz/enigma-swing/$pkgver/enigma-swing-$pkgver-all.jar"
        "enigma.sh"
        "enigma.desktop")
noextract=("enigma-swing-$pkgver-all.jar")
package() {
	export ENIGMA_JAR_NAME="enigma-swing-$pkgver-all.jar"
	install -Dm644 "$ENIGMA_JAR_NAME" -t "${pkgdir}/usr/share/java/enigma"
	install -dm755 "${pkgdir}/usr/bin"
	envsubst < enigma.sh > "${pkgdir}/usr/bin/enigma"
	chmod 755 "${pkgdir}/usr/bin/enigma"
	install -Dm644 enigma.desktop -t "${pkgdir}/usr/share/applications"
}

sha512sums=('f222709f22a9f7823143b9643900450ad25b905a7d7b757a10c89a8506922d6cd0efbbe5da28618d7c6440300f9a5a544c7a3ea861a2c377a62d6a07a8112c39'
            'c419eda244b9aec581d396dafa6fbe33b518c7413da70fd3a19c7d2011cf0f9caf38c7f2945faf9927514131357eba1dd2f5307998ba03be923e2e54bfdb3e9c'
            '18f54cb866b1266b2ed95a34cf5efde660f2b4136319cec15b162ee498678e52628239b50fda15b6c1cce968495f8908e2f11ed99f47a5bbfd173173103f2fbf')
