# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
_pkgname=raspotify
pkgname=$_pkgname-bin
pkgver=0.46.0
_libver=v0.6.0-383a6f6
pkgrel=1
pkgdesc='A Spotify Connect client that mostly Just Works (librespot)'
arch=(x86_64 aarch64 armv7h)
url='https://dtcooper.github.io/raspotify'
license=(MIT)
depends=(alsa-lib gcc-libs libpulse bash glibc)
optdepends=(avahi)
provides=($_pkgname)
conflicts=($_pkgname)
backup=(etc/raspotify/conf)
source_x86_64=( https://github.com/dtcooper/raspotify/releases/download/$pkgver/raspotify_$pkgver.librespot.${_libver}_amd64.deb)
source_aarch64=(https://github.com/dtcooper/raspotify/releases/download/$pkgver/raspotify_$pkgver.librespot.${_libver}_arm64.deb)
source_armv7h=( https://github.com/dtcooper/raspotify/releases/download/$pkgver/raspotify_$pkgver.librespot.${_libver}_armhf.deb)
sha256sums_x86_64=('7550eed72c4a8fc8d59afb263fc2b148b9097623bac4a54ea9b2228b4383fbb3')
sha256sums_aarch64=('a16697f3f0f4c96052d7f093b22e3821353cc1278bdb79cbdc2670c3c314a3a9')
sha256sums_armv7h=('8e19b51e75efc51b68b2b99f8d7da710070b0bab7bd844e2d5d07174ff3222fc')

package() {
	bsdtar --no-same-owner -xpJf data.tar.xz -C "$pkgdir"
	mv "$pkgdir"/lib "$pkgdir"/usr
	chmod 600 "$pkgdir"/etc/raspotify
}
