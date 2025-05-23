# Maintainer: Akash Sil <akashsil420@duck.com>
pkgname='dare-devil'
pkgver=0.1.2
pkgrel=1
pkgdesc="It's a hellish game and going to be wickedly fun and challenging.Full of thrilling twists and turns..."
url='https://github.com/Akash420-oss/Dare-Devil'
arch=('x86_64')
license=('MIT')
depends=('git' 'gcc' 'iptables' 'glibc' 'zenity')
checkdepends=('git' 'gcc' 'iptables' 'glibc' 'zenity')
makedepends=('git' 'gcc' 'iptables' 'glibc' 'zenity')
source=($pkgname::git+https://github.com/Akash420-oss/Dare-Devil.git)
md5sums=('SKIP')
prepare(){
	if [ -d "/usr/share/$pkgname" ]
	then 
		echo -e "\033[0;5;31mThe Package already exists. Try to delete some older files and rerun this..\033[0m"
	fi
	cd $pkgname
	rm -f install.sh uninstall.sh 'devil_&angel.gif'
}	
build(){
cd $pkgname
chmod a+x dare_devil
rm -f dare_devil.c
}
package(){
	cd $pkgname
	install -Dm 755 ./dare_devil "$pkgdir/usr/bin/dare_devil"
	install -Dm 644 custom_fun.h "$pkgdir/usr/include/custom_fun.h"
	install -Dm 644 create_soul_data.h "$pkgdir/usr/include/create_soul_data.h"
	install -Dm 644 devil_art.h "$pkgdir/usr/include/devil_art.h"
	install -Dm 644 system_crash.h "$pkgdir/usr/include/system_crash.h"
	install -Dm 755 dare-devil.desktop "$pkgdir/usr/share/applications/dare-devil.desktop"
	install -Dm 755 Dare_Devil.png "$pkgdir/usr/share/pixmaps/Dare_Devil.png"
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
