# Maintainer: Akash Sil <akashsil420@duck.com>
pkgname='project-monalisa'
pkgver=1.0
pkgrel=1
url='https://github.com/Akash420-oss/project-monalisa'
pkgdesc="This project allows you to explore networking protocols by sending custom packets, monitoring traffic, and identifying services like SSH, FTP, and Telnet without using traditional commands or tools."
arch=('x86_64')
license=('MIT')
depends=('git' 'firefox' 'wireshark-qt' 'gnome-terminal' 'python' 'nmap' 'termshark' 'tcpdump' 'nmap')
checkdepends=('git' 'firefox' 'wireshark-qt' 'gnome-terminal' 'python' 'python-pip' 'termshark' 'tcpdump' 'nmap')
makedepends=('git' 'firefox' 'wireshark-qt' 'gnome-terminal' 'python' 'python-pip' 'termshark' 'tcpdump' 'nmap')
source=($pkgname::git+https://github.com/Akash420-oss/Project-Monalisa.git)
md5sums=('SKIP')
package(){
	cd $pkgname
	mv mona.py mona 
	install -Dm 755 ./mona "$pkgdir/usr/bin/mona"
	install -Dm 755 ./protocol.json "$pkgdir/usr/share/mona/protocol.json"
	install -Dm 755 ./project-monalisa.desktop "$pkgdir/usr/share/applications/project-monalisa.desktop"
	install -Dm 644 ./project_mona.png "$pkgdir/usr/share/pixmaps/project_mona.png"
	install -Dm 644 ./README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm 644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	sudo pip install -r requirements.txt --break
}
