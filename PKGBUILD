# Maintainer: Alex Zose <alexander.zosimidis[at]gmail[dot]com>
pkgname=taskunifier
pkgver=4.3.4
pkgrel=1
pkgdesc="A task management software based on the well-known GTD (getting things done) methodology."
url="http://www.taskunifier.com/"
arch=('any')
license=('BSD')
depends=('java-environment' 'bash')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("http://downloads.sourceforge.net/project/taskunifier/binaries/TaskUnifier_4_3_4/TaskUnifier_4_3_4_linux.tar.gz"
	"taskunifier.desktop")
md5sums=('aa006b36108e8a71dfa6a690b9cd7f5c'
	 'f25858686360b4b15c45445fb1666944')
 
 prepare() {
  sed -i 's/`dirname \$0`/\/opt\/TaskUnifier/' ${srcdir}/TaskUnifier/TaskUnifier.sh
 }
 
 package() {
  mkdir ${pkgdir}/opt
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/applications
  cp -R ${srcdir}/TaskUnifier ${pkgdir}/opt
  mv ${pkgdir}/opt/TaskUnifier/TaskUnifier.sh ${pkgdir}/usr/bin
  install -m644 taskunifier.desktop ${pkgdir}/usr/share/applications
 }