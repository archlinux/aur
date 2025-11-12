# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
_pkgname=raspotify
pkgname=$_pkgname-bin
pkgver=0.48.0
_libver=v0.8.0-d36f9f1
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
sha256sums_x86_64=('693d07c3fc6c71b5ce978cc189276c10d02635d1020b4570dc71c2c60be3d683')
sha256sums_aarch64=('a75fe65f593f4d76d4d9c7fb82cbe930712c650beab0e6234ffcfb4093c86c6c')
sha256sums_armv7h=('ecdf2156bf6de997a5d4c97ea4c2f3f07daf42c58ab92e170e2ed1974f5e5228')

package() {
	bsdtar --no-same-owner -xpJf data.tar.xz -C "$pkgdir"
	mv "$pkgdir"/lib "$pkgdir"/usr
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname "$pkgdir"/usr/share/doc/raspotify/*copyright
	chmod 600 "$pkgdir"/etc/raspotify
}
