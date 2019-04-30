# Original Contributor: Archie <xMickael@ifrance.com>
# Contributor : Anish Bhatt <anish[removethis][at]gatech[dot]edu>
# Maintainer : blubbblubb <lampadada[removeme][at]googlemail[dot]com>

pkgname=phatch
pkgver=0.2.7.1
pkgmajorv=0.2.7
pkgrel=11
pkgdesc="A simple to use cross-platform GUI Photo Batch Processor."
arch=('i686' 'x86_64')
url="http://photobatch.stani.be"
license=('GPL')
depends=('python2' 'wxpython' 'python2-pillow' 'mlocate')
optdepends=('python2-nautilus' 'pyexiv2')
provides=(phatch="$pkgver")
install="$pkgname.install"
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.orig.tar.gz"
        'phatch.patch')
sha256sums=('ba602095f6a78b53fe71825dd6b9786babf6e226dddcab6d72db012ff1e8d91d'
            '78bfc00ae82e7a5825949e5dfd5f9f1cdb966bb03fbe5be4ef871b5fd17b0256')

prepare() {
    cd "$srcdir/$pkgname-$pkgmajorv"
    patch -p1 < "$srcdir"/phatch.patch
}

package() {
    cd "$srcdir/$pkgname-$pkgmajorv"
    python2 setup.py install --root=${pkgdir}
}
