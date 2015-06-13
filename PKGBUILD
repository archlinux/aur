# Maintainer: SanskritFritz (gmail)

pkgname=scduply-git
_gitname="scduply"
pkgver=2011.11.30
pkgrel=1
epoch=1
pkgdesc="A duplicity frontend for managing dedicated server backups via configuration files and simple commands."
arch=('any')
url="http://en.skycover.ru/opensource/scduply/"
license=('GPLv2')
provides=("scduply")
conflicts=("scduply")
depends=("duplicity")
makedepends=("git")
source=("git://github.com/skycover/scduply.git")
md5sums=('SKIP')

pkgver() {
        cd "$_gitname"
        git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

package() {
	cd "$srcdir/$_gitname"
	mkdir "$pkgdir/usr"
	./install.sh "$pkgdir/usr"
}

