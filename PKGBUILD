# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-space-haven
pkgver=0.15.1
_pkgtag=$pkgver
pkgrel=1
pkgdesc="Embark on a space voyage with your ragtag crew of civilians in search of a new home."
arch=('any')
url="https://www.gog.com/game/space_haven"
license=('custom')
makedepends=('lgogdownloader')
depends=('java-runtime' 'bash')
source=("space_haven_english_${pkgver//./_}.sh::gogdownloader://1589675197/en3installer0"
        "Space Haven.desktop"
        "start-spaceheaven.sh")
sha512sums=('192888f3e249f91003ac94dab029b7e7810378f5d43c079539b98f75d4b3378bb9e097c6eaa660b0b3bfa15dea974ca5d59cf78d1e9f8c52928aa5e7d2989c48'
            'caecccc1cc3a125b468a6359bbfc921721939d2ac1f78b806e3c1b76c399ee256a59daf49236746923893a5969818ad0da2f9aadb098278cfd314d1ab177ed16'
            'd97a6507c9cf051dbca53124665410d363ab9e343a0c1957701a19ccc4c6a3fe0abf54143020c5e58b2fe91e66f6be510ef3c34256f25a6e67521b52f41754a0')

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

package()
{
	install -Dm 644 "${srcdir}/data/noarch/game/spacehaven.jar" "${pkgdir}/opt/$pkgname/spacehaven.jar"
	install -Dm 755 "${srcdir}/start-spaceheaven.sh" "${pkgdir}/usr/bin/spacehaven"
	install -Dm 755 "${srcdir}/Space Haven.desktop" "$pkgdir/usr/share/applications/Space Haven.desktop"
	install -Dm 644 "${srcdir}/data/noarch/support/icon.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png"
	install -Dm 644 "${srcdir}/data/noarch/docs/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
