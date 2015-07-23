# Maintainer: Nils Christopher Brause <nilschrbrause@googlemail.com>
pkgname=wayland++-git
pkgver=56
pkgrel=1
pkgdesc='Wayland C++ bindings'
arch=('i686' 'x86_64' 'armv5' 'armv6' 'armv7' 'armv8')
url='https://github.com/NilsBrause/waylandpp'
licanse=('MIT' 'GPL3')
depends=(wayland)
makedepends=(scons)
source=("${pkgname}::git+https://github.com/NilsBrause/waylandpp.git")
md5sums=('SKIP')

pkgver()
{
    cd $pkgname
    git log --pretty=oneline | wc -l
}

build()
{
    cd $pkgname
    scons
}

package()
{
    cd $pkgname
    PREFIX="$pkgdir/usr" scons install
}

# Local Variables:
# mode: shell-script
# End:
