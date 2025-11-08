# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
_pkgname=raspotify
pkgname=$_pkgname-bin
pkgver=0.47.1
_libver=v0.7.1-7b3cd63
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
sha256sums_x86_64=('9700b13a6939be4b04f1043a6db62c2965a3b1f984cea68189480bc97918289c')
sha256sums_aarch64=('378e4fe12bb2187e0ea857989b7e6aa7b0a6bffad1a6b2230bd886dbdf690500')
sha256sums_armv7h=('b429c2fa44452d1aa7674034beaa6a7807264bae780a6b4114b31555e00f6e85')

package() {
	bsdtar --no-same-owner -xpJf data.tar.xz -C "$pkgdir"
	mv "$pkgdir"/lib "$pkgdir"/usr
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname "$pkgdir"/usr/share/doc/raspotify/*copyright
	chmod 600 "$pkgdir"/etc/raspotify
}
