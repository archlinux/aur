#Maintainer Helder Filho <heldinho@gmail.com>
pkgname=blackwallet
pkgver=rolling
pkgrel=1
pkgdesc="Gerenciador de carteira de renda variável para ativos da Bovespa."
arch=('x86_64')
url="https://www.blackwallet.com.br"
license=('custom:blackwallet')
options=('!emptydirs' '!strip')

source=(https://blackwallet.com.br/BlackWallet.tar.gz)
sha256sums=('3d8c98af2f754fc4c91f15c7ccbad513feaf73565d198a7d6ee2da07e78ad48d')
package() {
	pwd
	mkdir $pkgdir/opt
	mkdir $pkgdir/usr
	mkdir $pkgdir/usr/bin
	echo "#!/bin/bash" >> $pkgdir/usr/bin/blackwallet
	echo "mkdir -p ~/.blackwallet" >> $pkgdir/usr/bin/blackwallet
	echo "cd ~/.blackwallet && /opt/BlackWallet/bin/BlackWallet &> /dev/null" >> $pkgdir/usr/bin/blackwallet
	chmod +x $pkgdir/usr/bin/blackwallet
	tar -zxf "$srcdir/BlackWallet.tar.gz" -C "$pkgdir/opt/"
}
