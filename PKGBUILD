# Maintainer: aarto <aarto@aur.archlinux.org>
# Contributor: Kimiblock

_pkgname=librewolf-extension-sponsorblock
pkgname=$_pkgname-bin
_id='sponsorBlocker@ajay.app'
url="https://github.com/ajayyy/SponsorBlock"
pkgver=6.0.2
pkgrel=1
pkgdesc="Skip YouTube video sponsors."
arch=('any')
license=('GPL-3.0-or-later')
depends=('librewolf')
provides=("$_pkgname")
conflicts=("$_pkgname")
groups=('librewolf-addons')
noextract=("$_id.xpi")
source=("$_id.xpi::$url/releases/download/$pkgver/FirefoxSignedInstaller.xpi"
		"https://raw.githubusercontent.com/ajayyy/SponsorBlock/refs/tags/$pkgver/LICENSE")
b2sums=('5a2b20e4a79127adb2ff6ba6df0d5c40fec143f2f6cc712fc5709981eaa77d810866827498f216f529c8262135447452f8bb339cf9d06f7a92e323d361e00aa9'
        'ab7e38fc42fb6686add7393ecc3c7ec622cc0d72d0304ded3e56c2f96dc8433c584520896a30c037affa44461ecccfaf3ffa4a97a7e050e8ed0ec4c592caa45c')

package() {
	install -Dm644 $_id.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/$_id.xpi"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
