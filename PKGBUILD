# Maintainer: Autumn Booth <autumn@qtautumn.com>
pkgname='grfcodec-bin'
_pkgname='grfcodec'
pkgver=6.0.6
pkgrel=1
pkgdesc='A set of tools for developing (New)GRFs'
arch=('x86_64')
url='https://github.com/OpenTTD/grfcodec'
license=('GPL2')
depends=('zlib' 'gcc-libs' 'glibc')
provides=('grfcodec')
conflicts=('grfcodec')
source=('https://cdn.openttd.org/grfcodec-releases/6.0.6/grfcodec-6.0.6-linux-generic-amd64.tar.gz')
md5sums=('f0cd2dfbdad7713b27d4e5d2a479bda4')


package() {
	cd "$_pkgname-$pkgver-linux-generic-amd64"

	install -Dm755 ./grfcodec "$pkgdir/usr/bin/grfcodec"
    install -Dm755 ./grfid "$pkgdir/usr/bin/grfid"
    install -Dm755 ./grfstrip "$pkgdir/usr/bin/grfstrip"
    install -Dm755 ./nforenum "$pkgdir/usr/bin/nforenum"

    install -dm755 \
        "$pkgdir/usr/share/doc/$_pkgname"\
        "$pkgdir/usr/share/man/man1"
    
    install -Dm644 ./man/*.1.gz "$pkgdir/usr/share/man/man1/"
    install -Dm644 ./docs/* "$pkgdir/usr/share/doc/$_pkgname/"

}
