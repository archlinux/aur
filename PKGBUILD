# Maintainer: crow <aderyncrow@gmail.com>
pkgname="typefighters-bin"
pkgver="1.3"
pkgrel=1
pkgdesc="competitive multiplayer game where two players battle each other using their typing skills(free version)"
arch=(x86_64)
url="https://typefighters.com"
source=(typefighters.desktop
        "typefighters.tar::https://typefighters.com/sendfile.php?id=23"
)
sha256sums=('506e246bc26cd21cb5b384a6d2049263b298378bb57b5050a1e0e94776eee023'
            'b06521cb3dca7dc07eacd58ec58f8163b6f5a500644ac34f3d9fa863334a860e')

package() {
	install -Dm644 "typefighters.desktop" "$pkgdir/usr/share/applications/typefighters.desktop"

	cd "Typefighters"
	install -Dm755 "Typefighters.x86" "$pkgdir/usr/lib/typefighters/Typefighters.x86"
	cp -r "Typefighters_Data" "$pkgdir/usr/lib/typefighters/Typefighters_Data"
	cp -r "Licences" "$pkgdir/usr/lib/typefighters/Licences"
	install -Dm644 "Typefighters_Data/Resources/UnityPlayer.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/typefighters.png"
}
