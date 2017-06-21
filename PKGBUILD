# Maintainer: Okashi <okashi@fourchin.net>
pkgname=owo-cli
pkgver=0.0.19
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
sha256sums=('0006e58d8394661aea91ab340265cb533c2c515a6a065760fa38b4a0c0feec6b')
validpgpkeys=('BB7D46DCFBB23FBCB70D3F2A5831FF554202E5C2') # Okashi

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
