# Maintainer: Akash Sil <akashsil420@duck.com>
pkgname='project-monalisa-git'
pkgver=0.1.1
pkgrel=1
url='https://github.com/Akash420-oss/project-monalisa'
pkgdesc="This project allows you to explore networking protocols by sending custom packets, monitoring traffic, and identifying services like SSH, FTP, and Telnet without using traditional commands or tools."
arch=('any')
license=('MIT')
depends=('git' 'firefox' 'wireshark-qt' 'gnome-terminal' 'proxychains' 'sudo' 'python' 'nmap' 'termshark' 'tcpdump' 'nmap' 'scapy' 'python-progressbar' 'python-rich' 'python-distro' 'python-termcolor' 'python-prettytable' 'python-treelib')
#checkdepends=('git' 'firefox' 'wireshark-qt' 'gnome-terminal' 'python' 'python-pip' 'termshark' 'tcpdump' 'nmap' 'scapy' 'python-progressbar' 'python-rich' 'python-distro' 'python-termcolor' 'python-prettytable' 'python-treelib')
makedepends=('git')
source=("$pkgname.deb::https://github.com/Akash420-oss/Project-Monalisa/releases/download/$pkgver/$pkgname.deb"
        "$pkgname.zip::https://github.com/Akash420-oss/Project-Monalisa/releases/download/$pkgver/$pkgname.zip"
        "$pkgname::git+https://github.com/Akash420-oss/Project-Monalisa.git#tag=$pkgver")
md5sums=('54df9ddb2919551e5cc535be6a81fd87'
	 '3292a369ae3bf954e6fa7a3941c5719a'
	 'SKIP')
prepare(){
	cd $pkgname 
	rm -f install.sh uninstall.sh
}
package(){
	cd $pkgname
	mv mona.py mona 
	install -Dm 755 ./mona "$pkgdir/usr/bin/mona"
	install -Dm 755 ./protocol.json "$pkgdir/usr/share/mona/protocol.json"
	install -Dm 755 ./project-monalisa.desktop "$pkgdir/usr/share/applications/project-monalisa.desktop"
	install -Dm 644 ./project_mona.png "$pkgdir/usr/share/pixmaps/project_mona.png"
	install -Dm 644 ./README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm 644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
