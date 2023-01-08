# Maintainer: Ayush Shenoy <ayush.shenoy92@gmail.com>
# Contributor: Paulo Castro <p.oliveira.castro@gmail.com>
_pkgname='xppaut'
pkgname="$_pkgname-bin"
pkgver=8.0
pkgrel=2
pkgdesc="Tool for simulating, animating, and analyzing dynamical systems"
arch=('i686' 'x86_64')
url="https://sites.pitt.edu/~phase/bard/bardware/xpp/xpp.html"
license=('GPL')
depends=('libx11')
source=("https://sites.pitt.edu/~phase/bard/bardware/binary/latest/xpplinux.tgz")
md5sums=('4645feb732deca97bb4a276b74c21010')

package() {
	cd "${srcdir}/${_pkgname}${pkgver}ubuntu"
    install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 cuda/* -t "$pkgdir/usr/share/doc/$_pkgname/cuda"
    install -Dm644 ode/* -t "$pkgdir/usr/share/doc/$_pkgname/ode"
    install -Dm644 canonical/* -t "$pkgdir/usr/share/doc/$_pkgname/canonical"
    install -Dm644 tstauto/* -t "$pkgdir/usr/share/doc/$_pkgname/tstauto"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm755 README "$pkgdir/usr/share/doc/$_pkgname/README"
    install -Dm755 $_pkgname.1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
    mandb
}
