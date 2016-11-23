# Original Contributor: Archie <xMickael@ifrance.com>
# Contributor : Anish Bhatt <anish[removethis][at]gatech[dot]edu>
# Maintainer : blubbblubb <lampadada[removeme][at]googlemail[dot]com>

pkgname=phatch
pkgver=0.2.7.1
pkgmajorv=0.2.7
pkgrel=9
pkgdesc="Phatch is a simple to use cross-platform GUI Photo Batch Processor."
arch=('i686' 'x86_64')
url="http://photobatch.stani.be"
license=('GPL')
depends=('python2' 'wxpython' 'python2-pillow' 'mlocate')
optdepends=('python2-nautilus' 'pyexiv2')
provides=(phatch="$pkgver")
install="$pkgname.install"
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.orig.tar.gz"
        'phatch.patch')
md5sums=('c0638bcc6510d340c03c40ddfb0a0c2f'
         '2716d5d4aa241a4d45fd9e1fec486fad')

prepare() {
    cd "$srcdir/$pkgname-$pkgmajorv"
    patch -p1 < "$srcdir"/phatch.patch
}

package() {
    cd "$srcdir/$pkgname-$pkgmajorv"
    python2 setup.py install --root=${pkgdir}
}
