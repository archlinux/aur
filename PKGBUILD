# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=sph2pipe
pkgdesc='Converts SPHERE-formatted audio to usable audio'
pkgver=2.5
pkgrel=2
depends=('glibc')
arch=('x86_64' 'i686')
url='https://www.openslr.org/'
license=('APACHE')
source=("https://www.openslr.org/resources/3/sph2pipe_v$pkgver.tar.gz")
#        "https://sourceforge.net/projects/kaldi/files/sph2pipe_v$pkgver.tar.gz") // Backup
sha256sums=('5be236dc94ed0a301c5c8a369f849f76799ec7e70f25dfc0521068d9d1d4d3e3')

build() {
	cd "$srcdir/${pkgname}_v$pkgver/"
    if [ -z "$CC" ]; then
        CC=cc
    fi
    $CC $CFLAGS $LDFLAGS file_headers.c shorten_x.c sph2pipe.c -o sph2pipe
}

package() {
	cd "$srcdir/${pkgname}_v$pkgver/"
	install -Dm755 sph2pipe "$pkgdir/usr/bin/sph2pipe"
}
