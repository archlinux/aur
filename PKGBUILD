# Maintainer: Brodi <me@brodi.space>
pkgname=obs-rtspserver-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="RTSP server plugin for obs-studio"
arch=("x86_64")
url="https://github.com/iamscottxu/obs-rtspserver"
license=('GPL')
depends=('obs-studio>=24.0.0')
source=("https://github.com/iamscottxu/obs-rtspserver/releases/download/v${pkgver}/obs-rtspserver-v${pkgver}-linux.tar.gz"
	"https://raw.githubusercontent.com/iamscottxu/obs-rtspserver/master/LICENSE")
md5sums=('e48978a61eb47e51fa17533c89309712'
	 'SKIP')

build() {
	if [ -d "$HOME/.config/obs-studio/plugins/" ]; then
    		echo "[+] The OBS-Studio plugin folder exists. ($HOME/.config/obs-studio/plugins/)"
		echo "[*] Creating the OBS-Studio plugin folder.... ($HOME/.config/obs-studio/plugins/)"
		mkdir -p "$HOME/.config/obs-studio/plugins/obs-rtspserver/bin/64bit/"
                mkdir -p "$HOME/.config/obs-studio/plugins/obs-rtspserver/data/locale/"

	else
		echo "[-] The OBS-Studio plugin folder DOES NOT exist!"
		echo "[*] Creating the OBS-Studio plugin folder.... ($HOME/.config/obs-studio/plugins/)"
		mkdir -p "$HOME/.config/obs-studio/plugins/obs-rtspserver/bin/64bit/"
		mkdir -p "$HOME/.config/obs-studio/plugins/obs-rtspserver/data/locale/"
	fi
}

package() {
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"	
	cp -r obs-rtspserver $HOME/.config/obs-studio/plugins/
}
