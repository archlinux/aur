# Maintainer: Luis Manuel Rivero <riveroluismanuel9@gmail.com>
pkgname=static-git
pkgver=1.0
pkgrel=4
epoch=0
pkgdesc="A static HTML site generator inspired by React"
arch=('any')
url="https://github.com/GearFox98/static.git"
license=('MIT')
provides=(static-init)
conflicts=(static-init)
install=static.install
source=("git+https://github.com/GearFox98/static.git#branch=master")
sha256sums=('SKIP')

package(){
    mkdir -p "$pkgdir/opt/"

    cp -r "$srcdir/static" "$pkgdir/opt/static"
    sed "s/SKEL = os.path.join(BASE_DIR, 'skel')/SKEL = '\/opt\/static\/skel'/" $pkgdir/opt/static/static-init > $pkgdir/opt/static/static-init.2
    rm $pkgdir/opt/static/static-init
    mv $pkgdir/opt/static/static-init.2 $pkgdir/opt/static/static-init
}
