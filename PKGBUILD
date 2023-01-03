# Maintainer: Ayush Shenoy <ayush.shenoy92@gmail.com>
pkgname=xppaut-bin
pkgver=8.0
pkgrel=1
pkgdesc="Tool for simulating, animating, and analyzing dynamical systems"
arch=('i686' 'x86_64')
url="https://sites.pitt.edu/~phase/bard/bardware/xpp/xpp.html"
license=('GPL')
depends=('libx11')
source=("https://sites.pitt.edu/~phase/bard/bardware/binary/latest/xpplinux.tgz")
md5sums=('4645feb732deca97bb4a276b74c21010')

package() {
	cd "${srcdir}/xppaut${pkgver}ubuntu"
    install -Dm755 xppaut "$pkgdir/usr/bin/xppaut"
    install -Dm644 cuda/* -t "$pkgdir/usr/share/doc/xppaut/cuda"
    install -Dm644 ode/* -t "$pkgdir/usr/share/doc/xppaut/ode"
    install -Dm644 canonical/* -t "$pkgdir/usr/share/doc/xppaut/canonical"
    install -Dm644 tstauto/* -t "$pkgdir/usr/share/doc/xppaut/tstauto"
    install -Dm755 LICENSE "$pkgdir/usr/share/doc/xppaut/LICENSE"
    install -Dm755 README "$pkgdir/usr/share/doc/xppaut/README"
    install -Dm755 xppaut.1 "$pkgdir/usr/share/man/man1/xppaut.1"
    mandb
}
