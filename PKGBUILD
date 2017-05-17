# Maintainer: Okashi <okashi@fourchin.net>
pkgname=owo-cli
pkgver=0.0.18
pkgrel=1
epoch=
pkgdesc="A bash based file uploader and URL shortener for owo.whats-th.is"
arch=('x86_64')
url="https://whats-th.is"
license=('MIT')
groups=()
depends=('curl' 'xclip' 'maim' 'slop' 'grep' 'libnotify')
changelog=
source=("https://github.com/whats-this/owo.sh/raw/master/dist_pkgs/owo-cli-0.0.18.tar.gz")
noextract=()
sha256sums=('261c6ff4cde7b0d8dfd924e73e417c282c1f74bea9e2b5349694df7676de373c')
validpgpkeys=('AB52DA8BF01D9D5C0614376243A450B5185ADAA2') # Okashi

package() {
        tar zxf $pkgname-$pkgver.tar.gz
	cd "$pkgname-$pkgver"
        mkdir -p ~/.config/owo
        if [ -f ~/.config/owo/conf.cfg ]; then
    		cp ~/.config/owo/conf.cfg conf.cfg.bak
	fi
        cp ./* ~/.config/owo/
        cp ~/.config/owo/conf.cfg.bak ~/.config/owo/conf.cfg 2>/dev/null
        if [ -f /usr/local/bin/owo ]; then
		sudo rm /usr/local/bin/owo
	fi
        sudo ln -s ~/.config/owo/script.sh /usr/local/bin/owo
}
