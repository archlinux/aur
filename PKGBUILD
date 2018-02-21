# Maintainer: Jace Bennest <jacebennest87 at gmail dot com>
# Contributor: StevensNJD4 <github dot com slash StevensNJD4>
pkgname=lazyman
pkgver=2.3.0
pkgrel=1
pkgdesc="A simple program that lets you stream every NHL and MLB game"
arch=('any')
url="https://github.com/StevensNJD4/LazyMan"
license=('GPL')
depends=('python' 'python-setuptools' 'jdk8-openjdk')
optdepends=('vlc: optional video player - choose one' 'mpv: optional video player - choose one')
source=('https://github.com/StevensNJD4/LazyMan/releases/download/2.3.0.20171231/Mac_Linux.zip'
	"$pkgname".sh
	"$pkgname".desktop
	"$pkgname".png)

package() {
	sudo easy_install -U streamlink
	install -Dm755 "$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"
	install -Dm755 "$pkgname".desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
	install -Dm755 "$pkgname".png "$pkgdir"/opt/"$pkgname"/"$pkgname".png
	install -Dm755 LazyMan.jar "$pkgdir"/opt/"$pkgname"/"$pkgname".jar
}

md5sums=('d1366c1dcfc4ec786de42b90a478e709'
         '1d3917bff7f174d3e19e62d1ea2b49a7'
         'fdfd3f5bad0b9ec34f15a361ff737f4c'
         '41aebb968e8b6856d1b73cabd6a8c5d2')
