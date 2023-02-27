# Maintainer: tejonaco <tejonaco@gmail.com>

pkgname=kepubify-bin-git
pkgver=v4.0.4
pkgrel=1
pkgdesc="Convert your ePubs into kepubs, with a easy-to-use command-line tool."
arch=('any')
url="https://github.com/pgaskin/kepubify"
license=('MIT')

case $CARCH in
	amd64|x86_64)
		package_arch='64bit';;
	i386)
		package_arch='32bit';;
	armhf)
		package_arch='arm';;
	aarch64)
		package_arch='arm64';;
	*)
		echo "Architecture $CARCH not allowed"
		exit 1
		;;
esac
package="kepubify-linux-$package_arch"
source=("$url/releases/download/$pkgver/$package")

md5sums=('SKIP') #TO-DO
		 
pkgver(){
	git -c 'versionsort.suffix=-' ls-remote --tags --sort='v:refname' $url | tail --lines=1 | cut --delimiter='/' --fields=3
}


		 
package() {
  install -Dm755 "$srcdir/$package" "$pkgdir/usr/bin/kepubify"
}
