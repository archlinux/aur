# Maintainer: bigpod9 <bigpod9@gmail.com>
pkgname=dupliseek
pkgver=0.0.2
pkgrel=2
pkgdesc="Application to find all your duplicate images."
arch=('any')
url="https://gitlab.com/magnusmj/dupliseek.git"
license=('MIT')
depends=(python-pip)
install=dupliseek.install
source=(git+$url)
md5sums=('SKIP')

build()
{
    cd "$srcdir"/dupliseek
    pwd
    python setup.py build
}

package() {
    cd "$srcdir"/dupliseek

    mkdir -p $pkgdir/usr/share/applications/
    mkdir -p $pkgdir/usr/share/icons/

    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    cp icons/compare.png "$pkgdir"/usr/share/icons/dupliseek
    cp dupliseek.desktop "$pkgdir"/usr/share/applications/

}
