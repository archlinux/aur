# Maintainer: Arkylin <x@xyz.blue>
# Contributer: sinux <Unknown>

pkgname=aur-accelerate-cn
pkgver=1.0
pkgrel=1
pkgdesc='来自知乎sinux的文章：机智的解决arch/manjaro安装AUR软件时github下载软件包慢或不可获得的问题'
url="https://zhuanlan.zhihu.com/p/176987140"
arch=('any')
license=('unknown')
depends=('axel')
source=(
	'start.sh')
md5sums=(
	'120215840bdb5fc3ab4fc3f1c1bb1886')

package() { 
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp ${srcdir}/start.sh ${pkgdir}/opt/${pkgname}
	msg "请在/etc/makepkg.conf中修改DLAGENTS为以下内容！"
	echo "DLAGENTS=('file::/usr/bin/curl -gqC - -o %o %u'"
	echo "          'ftp::/usr/bin/axel -n 15 -a -o %o %u'"
	echo "          'http::/usr/bin/axel -n 15 -a -o %o %u'"
	echo "          'https::/opt/${pkgname}/start.sh %o %u'"
	echo "          'rsync::/usr/bin/rsync --no-motd -z %u %o'"
	echo "          'scp::/usr/bin/scp -C %u %o')"
}
