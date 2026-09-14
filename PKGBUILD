# Maintainer: rizukirr <rizkirr.xyz@gmail.com>
pkgname=mmcli-bin
_pkgname=mmcli
pkgver=0.1.1
pkgrel=1
pkgdesc="A command-line YouTube downloader with built-in audio/video format conversion"
arch=('x86_64' 'aarch64')
url="https://github.com/rizukirr/mmcli"
license=('MIT')
depends=('ffmpeg' 'glibc' 'zlib')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/rizukirr/mmcli/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-x86_64")
source_aarch64=("$_pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-aarch64")
sha256sums=('53fc69e9f347afbeca2b180cc840698a56ebdcf7e3de944557ce5c04dcba7c66')
sha256sums_x86_64=('f6fff92b570521b4b7eac227e3ccbc85b79a3cb1375a15089986352e19de432e')
sha256sums_aarch64=('410a8ef052a7e0a23b44048a19c361f7ccfe16e8134ad2366779990530dd342c')

package() {
	install -Dm755 "$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
