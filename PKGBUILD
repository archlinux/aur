# Maintainer: depsterr <depsterr at protonmail dot com>
pkgname=glasscord-bin
pkgver=0.0.6
pkgrel=1
epoch=
pkgdesc='Providing composition effects to the Discord client.'
arch=('any')
url='https://github.com/AryToNeX/Glasscord'
license=('Apache License 2.0')
groups=()
depends=('discord')
makedepends=('git' 'npm')
checkdepends=()
optdepends=()  
provides=("glasscord")    
conflicts=("glasscord") 
replaces=()
backup=()   
options=() 
install=
changelog=  
source=("https://github.com/AryToNeX/Glasscord/releases/download/v0.0.6/glasscord.asar")
noextract=()
md5sums=("0a40e9781a21ed484ed371185a5a0ef5")
validpgpkeys=()

package() {
	injdir=`find ~/.config/discord -name "discord_desktop_core" -type d`
	
	cp "$srcdir/glasscord.asar" "$injdir"

	echo "require('./glasscord.asar')" | cat - "$injdir/index.js" > "$srcdir/index.js"
	cp "$srcdir/index.js" "$injdir"
}

