# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gnatdoc
pkgver=23.0.0
pkgrel=1

pkgdesc='GNAT documentation generation tool.'
url='https://github.com/AdaCore/gnatdoc'
arch=('i686' 'x86_64')
#license=('GPL3' 'custom')

depends=(gnatcoll-core libvss markdown gpr-unit-provider libadalang)
makedepends=('gprbuild')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("123c8e3517512f6f4f7e92d62f2d0e1b35c8d59c87acc5ba504eeeb0988b20d5")


build()
{
    cd "$srcdir/$pkgname-$pkgver"
    make 
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"

    gprinstall gnat/gnatdoc.gpr    --prefix="$pkgdir/usr" --create-missing-dirs
    gprinstall gnat/libgnatdoc.gpr --prefix="$pkgdir/usr" --create-missing-dirs


#    # Install the license.
#    install -D -m644     \
#       "COPYING3"        \
#       "$pkgdir/usr/share/licenses/$pkgname/COPYING3"

}
