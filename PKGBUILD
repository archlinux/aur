# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=super-sonico-plus-size-adventure
pkgver=0.2c
pkgrel=1
arch=(any)
url=https://chocofl4n.itch.io/super-sonico-plus-size-adventure
license=(custom:unknown)
depends=(renpy)
makedepends=(itchio-dlagent)
source=("${pkgname}-${pkgver}.zip::itch://chocofl4n/super-sonico-plus-size-adventure/14967686")
sha256sums=('aec58ca52fcc7bb08cd770f5bd02210ab5f6e684a942273da93d0e624631a1e1')
DLAGENTS+=("itch::/usr/bin/itchio-dlagent %u %o")

package() {
	install -dm755 "${pkgdir}/usr/share/${pkgname}"
	cp -r "Stuffed_Sonico-0.2a-pc/game" "${pkgdir}/usr/share/${pkgname}"

	install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" << END
#!/usr/bin/env sh
renpy /usr/share/${pkgname}
END

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" << END
[Desktop Entry]
Name=Super Sonico Plus Size Adventure
Exec=${pkgname}
Terminal=false
Categories=Game;
Type=Application
Icon=${pkgname}
END
	install -Dm644 "Stuffed_Sonico-0.2a-pc/game/gui/window_icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
