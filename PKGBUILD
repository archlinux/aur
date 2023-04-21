# Maintainer: f4iey <f4iey@f6kgl.ampr.org>
# Contributor: f4iqn <f4iqn@f6kgl.ampr.org>
pkgname=yahpt-git
pkgver=r10.7f01dd2
pkgrel=2
pkgdesc="Yet Another HF Propagation Tool"
arch=('any')
license=('GPL3')
makedepends=('git')
depends=('python' 'python-requests' 'python-gobject' 'python-pillow')
url="https://gitlab.com/f4iey/yahpt.git"
source=($pkgname::"git+$url")

sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd $srcdir/$pkgname
        install -dm755 $pkgdir/opt/cqrprop
	install -dm755 $pkgdir/usr/bin/
        cp src/cqrprop.py $pkgdir/opt/cqrprop/
	cp bin/yahpt $pkgdir/usr/bin

}
