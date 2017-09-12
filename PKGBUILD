# Maintainer: Moritz Schoenherr <moritz.schoenherr[at]gmail[dot]com>
pkgname=ysoccer
pkgver=16
pkgrel=1
pkgdesc="Soccer game in the style of Sensible Soccer"
url="http://ysoccer.sourceforge.net/dloads.htm"
arch=('x86_64')
license=('GPL2')
depends=('java-runtime')
conflicts=()
replaces=()
backup=()
source=("https://downloads.sourceforge.net/project/ysoccer/YSoccer16/ysoccer16_linux64.tar.gz?r=http%3A%2F%2Fysoccer.sourceforge.net%2Fdloads.htm&ts=1505217790&use_mirror=netix"
	'ysoccer.sh')

md5sums=('74e048e805ab552e3c16be4210c723db'
	 'ae3b207fb6e6c39053c7ef5916a68897')

package() {

  cd "${srcdir}"

  install -D ysoccer.sh "$pkgdir/usr/bin/ysoccer"

  cd "ysoccer16_linux64"

  install -D ysoccer.jar "$pkgdir/usr/share/java/ysoccer/ysoccer.jar"

  mkdir -p /usr/share/ysoccer

  cp -R images "$pkgdir/usr/share/ysoccer/"

  cp -R music "$pkgdir/usr/share/ysoccer/"

  cp -R sounds "$pkgdir/usr/share/ysoccer/"

  cp -R data "$pkgdir/usr/share/ysoccer/"

  install -D currencies.json "$pkgdir/usr/share/ysoccer/currencies.json"

  install -D config.json "$pkgdir/usr/share/ysoccer/config.json"

}

