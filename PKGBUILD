# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=creators-tf-launcher-bin
pkgver=0.2.8
pkgrel=1
pkgdesc="The community launcher from the Creators.TF project for Team Fortress 2"
arch=('x86_64')
url="https://github.com/CreatorsTF/Creators.TF-Community-Launcher"
license=('MIT')
depends=('libnotify' 'libxss' 'nspr' 'nss' 'gtk3' 'c-ares' 'ffmpeg' 'libevent' 'libnghttp2' 'libxslt' 'minizip' 're2' 'snappy')
makedepends=('tar')
source=("https://github.com/ampersoftware/Creators.TF-Community-Launcher/releases/download/$pkgver/creators-tf-launcher_"$pkgver"_amd64.deb")
sha512sums=('35d171778e71b205ff30c78b9389a97a0cacae6010aaf697c685e018d8397a806eeac555a48b8a1e051bf9cab1a65dd8df2a2d4a0df5984e075205b77ed0578d')
conflicts=('creators-tf-launcher')

prepare() {
    tar xpf data.tar.xz
}


package() {
	mkdir -p "$pkgdir/opt"
	mkdir -p "$pkgdir/opt/Creators.TF Launcher"	
	cp -a "$srcdir/opt/Creators.TF Launcher/." "$pkgdir/opt/Creators.TF Launcher"
	
	install -Dm644 "${srcdir}/usr/share/applications/creators-tf-launcher.desktop" \
        "${pkgdir}/usr/share/applications/creators-tf-launcher.desktop"
	
	install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/creators-tf-launcher.png" \
        "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/creators-tf-launcher.png"

	install -Dm644 "${srcdir}/usr/share/doc/creators-tf-launcher/changelog.gz" \
	"${pkgdir}/usr/share/doc/creators-tf-launcher/changelog.gz"

		
}

