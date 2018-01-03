#Maintainer: Plague-doctor <plague <at>> privacyrequired <<dot>> com >

pkgname=bot-sentry
pkgver=1.3.0
pkgrel=3
pkgdesc="Bot Sentry is a Pidgin plugin to prevent Instant Message spam."
arch=('x86_64')
url="https://sourceforge.net/projects/pidgin-bs/"
license=('GPL')
depends=('pidgin' 'libpurple' 'glibc' 'intltool>=0.35.0')
source=( "https://downloads.sourceforge.net/project/pidgin-bs/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")

sha256sums=('e65581328a508a82cd32d246f4037ea3b044eafd223c3c967947f847db28e736')

validpgpkeys=('A8F7858263C1E39480B731DCEAD4F103068DF8E5')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make prefix="$pkgdir/usr/" install
}
