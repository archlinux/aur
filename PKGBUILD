# Maintainer: OrkenWhite <orkenwhite@disroot.org>
pkgname=ytfe
pkgver=1.27.0
pkgrel=1
pkgdesc="Lightweight YouTube client using the LCL toolkit"
arch=('x86_64' 'i686')
url="http://oscomp.hu"
license=('custom')
depends=('gtk2')
makedepends=('xz')
source=('http://oscomp.hu/depot/ytfe.png' 'http://oscomp.hu/depot/edl-preloader.lua.xz' 'ytfe.desktop' 'LICENSE')
source_x86_64=("${pkgname}_x86_64_${pkgver}.xz::http://oscomp.hu/depot/ytfe_direct/${pkgver}/ytfe_linux_x86_64.xz")
source_i686=("${pkgname}_i686_${pkgver}.xz::hhttp://oscomp.hu/depot/ytfe_direct/${pkgver}/ytfe_linux_i686.xz")
sha256sums=( '29220d99cb0e33675e2d349a023eea0877a3befefc61b19f4d901db29f7d1698' '1538efd4ad69915c36a12e48b2fb67606983d8dd38811726640952d6a3c03149' '44bc1c569ae7829e65bc5ec3525ad260a2dc64d340da0f9912c4395552134eae' 'bf8e1295602992c618eacbc43a36c201293c8a159f49dd42a724c72f5e8a5267')
sha256sums_x86_64=('fdd5ae0c07e916828b9a08aa74fc9f280b294587731736b37341cc33538bb44a')
sha256sums_i686=('5e12885cff0186c6619bb0cc97aa79be6dc09f7b56e9bc7cd424801285fe05ea')
optdepends=('youtube-dl: default downloader' 
	'mpv: default player'
	'vlc: compatible video player')
install="ytfe.install"
package() {
	install -Dm755 ${pkgname}_${arch}_${pkgver} $pkgdir/usr/bin/$pkgname
	install -Dm644 ${pkgname}.png $pkgdir/usr/share/icons/hicolor/16x16/apps/$pkgname.png
	install -Dm644 ${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
	install -Dm755 edl-preloader.lua $pkgdir/usr/bin/edl-preloader
}
