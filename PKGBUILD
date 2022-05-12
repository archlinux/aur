# Maintainer: Dominik Schwaiger <mail@dominik-schwaiger.ch>
pkgname=darch-conf
pkgver=2.4.8
pkgrel=1
epoch=0
pkgdesc='Configuration files, scripts and packages for an Archcraft based system'
arch=('any')
url='https://github.com/quiode/DARCH'
license=('custom:MIT')
groups=()
depends=('nextcloud-client' 'github-cli' 'discord' 'thunderbird' 'lutris' 'nvidia-dkms' 'nvidia-utils' 'lib32-nvidia-utils' 'nvidia-settings' 'vulkan-icd-loader' 'lib32-vulkan-icd-loader' 'lib32-mesa' 'vulkan-radeon' 'lib32-vulkan-radeon' 'vulkan-icd-loader' 'lib32-vulkan-icd-loader' 'lib32-mesa' 'vulkan-intel' 'lib32-vulkan-intel' 'vulkan-icd-loader' 'lib32-vulkan-icd-loader' 'steam' 'virtualbox' 'python-pip' 'signal-desktop' 'telegram-desktop' 'qbittorrent' 'converseen' 'inkscape' 'gimp' 'geogebra' 'flatpak' 'bitwarden' 'gparted' 'kdeconnect' 'libreoffice-fresh' 'qalculate-gtk' 'texlive-bibtexextra' 'texlive-core' 'texlive-fontsextra' 'texlive-formatsextra' 'texlive-games' 'texlive-humanities' 'texlive-latexextra' 'texlive-music' 'texlive-pictures' 'texlive-pstricks' 'texlive-publishers' 'texlive-science' 'texlive-bin' 'texlive-langextra' 'texlive-langgreek' 'biber' 'spotify' 'spotifyd' 'github-desktop' 'teams' 'joplin-appimage' 'drawio-desktop' 'muon-ssh' 'write_stylus' 'zotero' 'nvm' 'visual-studio-code-bin' 'ncmpcpp' 'mopidy' 'mopidy-spotify' 'mopidy-local' 'mopidy-mpd' 'heroic-games-launcher-bin' 'seahorse' 'appimagelauncher')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('flatpak.txt' 'snap.txt' 'DARCH' 'mopidy.conf' 'config' 'LICENSE')
noextract=()
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855' 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855' 'fc1eaf18d31196ec409860ecb1fad8d0485390ecfdddd12110ad419386d407fa' '38bf3e66075dc258cd9b404187ede3dad4fc709796aa8b52bb543d766a7e073d' '59f7fcbd8adc8645d7a8f43c91502d91a028062cba587e5a0320aef84dc18961' 'fff425b318f8fd6918fe3e45c8464cbfc6437c01cea84d21e79003e13044a6d6')
validpgpkeys=()

# prepare() {
# 	cd "$pkgname-$pkgver"
# 	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }

# build() {
# 	cd "$pkgname-$pkgver"
# 	./configure --prefix=/usr
# 	make
# }

check() {
	if ! command -v snap &>/dev/null; then
		echo "snap could not be found"
		exit
	fi
}

package() {
	# license
	install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# install
	install -Dm755 "$srcdir/DARCH" "$pkgdir/usr/bin/DARCH"
	install -Dm644 "$srcdir/flatpak.txt" "$pkgdir/usr/share/darch/flatpak.txt"
	install -Dm644 "$srcdir/snap.txt" "$pkgdir/usr/share/darch/snap.txt"

	# Spotify Music
	install -Dm644 "$srcdir/mopidy.conf" "$pkgdir/usr/share/darch/mopidy.conf"

	install -Dm644 "$srcdir/config" "$pkgdir/usr/share/darch/config"

	echo -e "\033[0;31mUse command DARCH to finish the install!"
}
