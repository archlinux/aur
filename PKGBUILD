# Maintainer: George Woodall <georgewoodall82@gmail.com>
pkgname=tgpt-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="ChatGPT in terminal without needing API keys"
arch=("x86_64" "aarch64" "i386")
url="https://github.com/aandrew-me/tgpt"
license=('GPL-3.0')
#makedepends=('')
source=("https://github.com/aandrew-me/tgpt/releases/download/v${pkgver}/tgpt-linux-amd64")
md5sums=('SKIP')

#pkgver() {
#	cd "$srcdir"
#	rm -rf tgpt
#	git clone --no-checkout https://github.com/aandrew-me/tgpt
#	cd tgpt
#	git describe --tags --abbrev=0 | sed 's/^v//'
#}

package() {
    cd "$srcdir"
    if [ $CARCH == "x86_64" ]
    then
    	ARCHY=amd64
    elif [ $CARCH == "aarch64" ]
    then
    	ARCHY=arm64
    elif [ $CARCH == "i386" ]
    then
    	ARCHY=i386
    else
    	echo $CARCH is unsupported
    	exit
    fi
    install -Dm755 tgpt-linux-${ARCHY} "$pkgdir/usr/bin/tgpt"
}
