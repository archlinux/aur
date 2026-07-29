# Maintainer: aarto <aarto@aur.archlinux.org>
# Contributor: Kimiblock

_pkgname=librewolf-extension-sponsorblock
pkgname=$_pkgname-bin
_id='sponsorBlocker@ajay.app'
url="https://github.com/ajayyy/SponsorBlock"
pkgver=6.1.7
pkgrel=1
pkgdesc="Skip YouTube video sponsors."
arch=('any')
license=('GPL-3.0-or-later')
depends=('librewolf')
provides=("$_pkgname")
conflicts=("$_pkgname")
groups=('librewolf-addons')
noextract=("$_id-$pkgver.xpi")
source=("$_id-$pkgver.xpi::$url/releases/download/$pkgver/FirefoxSignedInstaller.xpi"
		"LICENSE-$pkgver::https://raw.githubusercontent.com/ajayyy/SponsorBlock/refs/tags/$pkgver/LICENSE")
b2sums=('793de5636c13c63afe925cdc1f9b8a24e55136570aff6322b3dfaffd12ae0ee13b7db40460c777b71805723755089efe76f3b6c1b8a5c973b534a160942bbdb8'
        'ab7e38fc42fb6686add7393ecc3c7ec622cc0d72d0304ded3e56c2f96dc8433c584520896a30c037affa44461ecccfaf3ffa4a97a7e050e8ed0ec4c592caa45c')

package() {
	install -Dm644 "$_id-$pkgver.xpi" "$pkgdir/usr/lib/librewolf/browser/extensions/$_id.xpi"
	install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
