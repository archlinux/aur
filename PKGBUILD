# Gaku maintainer: Johan Sageryd <j@1616.se>
# AUR Maintainer: Raansu <Gero3977@gmail.com>

pkgname='gaku-git'
pkgver=1.2.1+2+g77efce8
pkgrel=1
pkgdesc="A experimental command line based spaced repetition software (SRS) Installs to /opt"
arch=('i686' 'x86_64')
url="https://github.com/jsageryd/gaku"
license=('MIT')
depends=('ruby>=1.9')
provides=('gaku')
conflicts=('gaku')
source=("$pkgname::git+https://github.com/jsageryd/gaku.git")
sha256sums=("SKIP")

pkgver() {
    cd $srcdir/$pkgname
    git describe --long --tags | sed 's/-/+/g; s/^v//'
}

package() {
	mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin"
	cd "${srcdir}"
	cp -r $pkgname $pkgdir/opt
	ln -s "/opt/${pkgname}/bin/gaku" "$pkgdir/usr/bin/gaku"
}
