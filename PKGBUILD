# Maintainer: depsterr <depsterr at protonmail dot com>
pkgname=glasscord
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
provides=()    
conflicts=() 
replaces=()
backup=()   
options=() 
install=
changelog=  
source=("https://github.com/AryToNeX/Glasscord/archive/v0.0.6.tar.gz")
noextract=()
md5sums=("f68649dcbb57829f1400bb85f03458fc")
validpgpkeys=()

build() {
	cd "$srcdir/Glasscord-$pkgver"
	npm install
}

package() {
	injdir=`find ~/.config/discord -name "discord_desktop_core" -type d`
	
	cp "$srcdir/Glasscord-$pkgver/glasscord.asar" "$injdir"

	echo "require('./glasscord.asar')" | cat - "$injdir/index.js" > "$srcdir/index.js"
	cp "$srcdir/index.js" "$injdir"
}

