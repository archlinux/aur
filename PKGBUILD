# Maintainer: xpander <xpander0 at gmail dot com>
# Maintainer: Natherul <natherul0 at gmail dot com>

pkgname=waraddonclient
_pkgname=WARAddonClient
pkgver=1.11.0
pkgrel=1
pkgdesc="Warhammer Return of Reckoning Addon Client"
arch=('x86_64')
url="https://github.com/Idrinth/WARAddonClient"
license=('MIT')
depends=('java-runtime')
source=("$_pkgname.jar::$url/releases/download/$pkgver/$_pkgname.jar"
        "$pkgname.desktop"
        "logo.png"
        "waraddonclient")
sha256sums=('a00a00119a66cabc37f55f5c9a9915146f8a115a69f4c36332249272f5752c19'
            '1ca564ed8afec3a55a126ccd3647e44588772ffa446efc7aa4414119cfb96690'
            '43c55b23d98950ed17d88d95d72e1eac1903f3f6a5b9ef99b29d328fe3cb5d24'
            '59e85dbcff989ffe50fe529ac53e1018b2e297b6bbba98f3ba097b73bc6ce28b')

package() {
	cd "$src"
	install -Dm644 $_pkgname.jar "$pkgdir/opt/$_pkgname/$_pkgname.jar"
	install -Dm644 logo.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm755 waraddonclient "$pkgdir/usr/bin/waraddonclient"
	install -Dm755 "$pkgname.desktop" -t "$pkgdir/usr/share/applications"

	touch /var/log/waraddonclient.log
    chmod 777 /var/log/waraddonclient.log
}
