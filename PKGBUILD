# Maintainer: Anna Ivanova <kalterfx@gmail.com>

pkgname='playmusicdecrypter-git'

pkgver='v1.0.r8.g5a2318a'
function pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/-/.r/;s/-/./'
}

pkgrel='1'
pkgdesc='Decrypt MP3 files from Google Play Music offline storage (All Access)'
url='https://github.com/playmusicdecrypter'
license=( 'GPL3' )

source=(  "$pkgname::git+https://github.com/playmusicdecrypter/playmusicdecrypter" )
md5sums=( 'SKIP' )

arch=( 'any' )
depends=( 'python2' 'python2-crypto' 'mutagen' )
optdepends=( 'android-tools' )

function package() {
	cd "$pkgname"
	./setup.py install --root "$pkgdir"
	install -Dv -T -- {.,"$pkgdir/usr/share/licenses/$pkgname"}/LICENSE
}

