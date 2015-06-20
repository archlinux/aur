# Maintainer: Vojtech Kral <vojtech_kral^hk>


pkgname=prisma-puzzle-timer
pkgver=0.6
pkgrel=1
pkgdesc="Feature-rich timer for a number of mechanical puzzles"
arch=('any')
url="https://bitbucket.org/walter/puzzle-timer"
  # Also: https://www.speedsolving.com/forum/showthread.php?25790-Prisma-Puzzle-Timer
license=('BSD')
depends=('java-runtime')

source=("https://bitbucket.org/walter/puzzle-timer/downloads/PrismaPuzzleTimer${pkgver}.jar"
        'prisma-puzzle-timer'
        'prisma-puzzle-timer.desktop')
# noextract=('PrismaPuzzleTimer${pkgver}.jar')
sha256sums=('9af37ba8f645e922edadb28997a028d2227bd41c90746d99887906e025e81709'
            'fe8ae332c7d896a0d6c556727336de4a22b5f5476d970423278621a94b5a54f9'
            'c3604cc9e11335a4deb8f127fd299b3e1a16d66bc39e969a37d9b509b36d3dc5')

package()
{
	install -Dm 644 "${srcdir}/PrismaPuzzleTimer${pkgver}.jar" "${pkgdir}/usr/share/prisma-puzzle-timer/PrismaPuzzleTimer${pkgver}.jar"
	install -Dm 644 "${srcdir}/com/puzzletimer/resources/icon.png" "${pkgdir}/usr/share/prisma-puzzle-timer/icon.png"
	install -Dm 755 "${srcdir}/prisma-puzzle-timer" "${pkgdir}/usr/bin/prisma-puzzle-timer"
	desktop-file-install --dir="${pkgdir}/usr/share/applications/" 'prisma-puzzle-timer.desktop'
}
