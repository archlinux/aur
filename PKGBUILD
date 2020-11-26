# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-space-haven
pkgver=0.10.2
_pkgtag=$pkgver
pkgrel=1
pkgdesc="Embark on a space voyage with your ragtag crew of civilians in search of a new home."
arch=('x86_64')
url="https://www.gog.com/game/space_haven"
license=('custom')
makedepends=('lgogdownloader')
depends=('jre-openjdk' 'bash' 'coreutils')
source=("space_haven_english_${pkgver//./_}.sh::gogdownloader://1589675197/en3installer0"
        "Space Haven.desktop"
        "start-spaceheaven.sh")
sha512sums=('8902694d3ec99871031728a7d41b253f05e346c088822d639e47891d8b3ecfb8265f26a85c842805be9d3814b306b8c3c53a3bde8b44e35863d960c52de81b7a'
            'caecccc1cc3a125b468a6359bbfc921721939d2ac1f78b806e3c1b76c399ee256a59daf49236746923893a5969818ad0da2f9aadb098278cfd314d1ab177ed16'
            'caf0d0d15d41349fb9bc33aa3ee7206e219c1a55b2358fe45f0f0a75a9ad6530190efd5575f667d6e39f67ee04f08d3222f8a2b8e3af94fb05a10ce0c5a254e3')

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

package()
{
	install -Dm 644 "${srcdir}/data/noarch/game/spacehaven.jar" "${pkgdir}/opt/$pkgname/spacehaven.jar"
	install -Dm 755 "${srcdir}/start-spaceheaven.sh" "${pkgdir}/usr/bin/spacehaven"
	install -Dm 755 "${srcdir}/Space Haven.desktop" "$pkgdir/usr/share/applications/Space Haven.desktop"
	install -Dm 644 "${srcdir}/data/noarch/support/icon.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png"
	install -Dm 644 "${srcdir}/data/noarch/docs/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
