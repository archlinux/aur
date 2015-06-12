# Maintainer: Lara Maia <lara@craft.net.br>
# Contributor: estranho <estranho@diogoleal.com>
# Contributor: tsester <spyridon.papanastasiou@gmail.com>
# Contributor: dserban <dserban01@yahoo.com>
# Contributor: LeCrayonVert <sunrider@laposte.net>
# Contributor: jelly <jelle@vdwaa.nl>
# Contributor: evr <evanroman at gmail>

pkgname=agedu
pkgver=20150422
_pkghash=3922ffe
pkgrel=1
pkgdesc="Track down wasted disk space"
arch=(i686 x86_64 armv6h)
url="http://www.chiark.greenend.org.uk/~sgtatham/agedu/"
license=('mit')
depends=('gcc-libs')

source=("http://www.chiark.greenend.org.uk/~sgtatham/$pkgname/$pkgname-$pkgver.$_pkghash.tar.gz"
        'LICENSE')
# SKIP because the upstream server changes the file all the time.
# That is a very strange behaviour... but I can't find anything suspect
md5sums=('SKIP'
         'add724d40e3f60ec98edadf497ec62e0')

build() {
    cd $pkgname-$pkgver.$_pkghash

    ./configure --prefix=/usr

    make
}

package() {
	cd $pkgname-$pkgver.$_pkghash

	make DESTDIR="$pkgdir" install

	install -Dm655 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/agedu/LICENSE
}
