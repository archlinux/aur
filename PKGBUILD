# Maintainer: xpander <xpander0 at gmail dot com>

pkgname=waraddonclient
_pkgname=WARAddonClient
pkgver=1.14.0
pkgrel=2
pkgdesc="Warhammer Return of Reckoning Addon Client"
arch=('x86_64')
url="https://github.com/Idrinth/WARAddonClient"
license=('MIT')
depends=('java-runtime')
source=("$_pkgname.jar::$url/releases/download/$pkgver/$_pkgname.jar"
        "$pkgname.desktop"
        "logo.png"
        "waraddonclient"
        "permissions.install")
sha256sums=('aaa0c0c09de9d6c3106d50743b09328970a37165fd216a6ddc565059d984b3b4'
            '1ca564ed8afec3a55a126ccd3647e44588772ffa446efc7aa4414119cfb96690'
            '43c55b23d98950ed17d88d95d72e1eac1903f3f6a5b9ef99b29d328fe3cb5d24'
            '87d2572d15f15ad3539b180f831b31343c9cd24cb3575120318eba8057b3c1ea'
            '997ffd59eb970d96fdb1f69515d94f3c2d9fdaa9af4fb3451ac6e1f46ca679b9')
install=permissions.install

package() {
	cd "$src"
	install -Dm644 $_pkgname.jar "$pkgdir/opt/$_pkgname/$_pkgname.jar"
	install -Dm644 logo.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm755 waraddonclient "$pkgdir/usr/bin/waraddonclient"
	install -Dm755 "$pkgname.desktop" -t "$pkgdir/usr/share/applications"
	
}
