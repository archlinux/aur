# Maintainer: Carneiro <therealcarneiro at gmail dot com>
pkgname=mobmuplat-editor
pkgver=0.34
pkgrel=1
pkgdesc="MobMuPlatEditor is an application to create and edit user interface files for use in the MobMuPlat iOS app"
url="https://danieliglesia.com/mobmuplat/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('java-runtime-common')
provides=('mobmuplat-editor')
makedepends=()
optdepends=()
source=("$url/MobMuPlatDistribution_1.82iOS_${pkgver}Android.zip"
"$pkgname"
"$pkgname".desktop)
md5sums=(
0b0b04fb747f5858372e43e79dd3e65c
e8ef293d2fa86a0338632ac0f57ef9af
1c0fdebce3e59decc565f83d07f6d7d7
)

package() {
	install -Dm755 $pkgname "$pkgdir/usr/bin/mobmuplat-editor"
	install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

	cd MobMuPlatDistribution_1.82iOS_${pkgver}Android/

	install -Dm644 PdWrapper.pd "$pkgdir/usr/share/$pkgname/PdWrapper.pd"
	install -Dm644 MobMuPlatTemplate.pd "$pkgdir/usr/share/$pkgname/MobMuPlatTemplate.pd"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 Editor/CrossPlatformJava/MobMuPlatEditor.jar "$pkgdir/usr/share/java/MobMuPlatEditor.jar"

	mkdir $pkgdir/usr/share/$pkgname/Patches
	install -D Patches/* "$pkgdir/usr/share/$pkgname/Patches"
}
