pkgname=mkl-fake-intel
pkgver=1
pkgrel=1
pkgdesc="Fake processor as Intel to MKL library, useful for Ryzen Processors"
arch=('x86_64')
url="https://danieldk.eu/mkl-amd-zen/"
license=('custom')
source=('mklfakeintel.c')
sha256sums=('854f865616f66d7320549b3bf1649cc9758b61c144d90329f70bbc1d04712e77')

package() {
    cd $srcdir
    gcc -shared -fPIC -o mklfakeintel.so mklfakeintel.c
    install -Dm755 mklfakeintel.so $pkgdir/usr/lib/mklfakeintel.so
    mkdir -p $pkgdir/etc/profile.d
    echo "export LD_PRELOAD=/usr/lib/mklfakeintel.so" > $pkgdir/etc/profile.d/mkl-fake-intel.sh
}

