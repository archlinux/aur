# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=creators-tf-launcher-bin
pkgver=0.2.7
pkgrel=2
pkgdesc="The community launcher from the Creators.TF project for Team Fortress 2"
arch=('x86_64')
url="https://creators.tf/launcher"
license=('MIT')
depends=('libnotify' 'libxss' 'nspr' 'nss' 'gtk3' 'c-ares' 'ffmpeg' 'libevent' 'libnghttp2' 'libxslt' 'minizip' 're2' 'snappy')
source=("https://github.com/ampersoftware/Creators.TF-Community-Launcher/releases/download/$pkgver/creators-tf-launcher_"$pkgver"_amd64.deb")
sha512sums=('2aebf08ebb44a6db7a90942f180880e575da2fc4d5c39065dac3510cec67337de40ae3d3dc54716f93c36c4dbe672e60c85c9c6c29f21210f2ff37aff8b32068')
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

