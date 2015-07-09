# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Maintainer: Pablo Lezaeta <prflr 88 (arro'a) gmail puntocom>

pkgname=util-say-git
_pkgname=util-say
pkgver=3.2.1.r272
pkgrel=1
pkgdesc="Tools for creating ponies for cowsay and cowsay-like programs"
arch=('any')
url="https://github.com/maandree/util-say"
license=('GPL3')
depends=('java-runtime>=6')
makedepends=('git' 'java-environment>=6' 'bash')
optdepends=('imagemagick: allows imgsrcrecovery to read frames in GIF files' 'perl: required for cowsay import support')
provides=('util-say')
conflicts=('util-say')
source=("$_pkgname::git+https://github.com/maandree/util-say")
md5sums=("SKIP")

pkgver(){
	cd $_pkgname
	echo "$(git describe --abbrev=0 ).r$(git rev-list --count HEAD | sed 's/-/./g' )"
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}
