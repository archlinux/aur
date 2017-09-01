# Maintainer: Nils Christopher Brause <nilschrbrause@googlemail.com>
pkgname=waylandpp-git
pkgver=176
pkgrel=1
pkgdesc='Wayland C++ bindings'
arch=('i686' 'x86_64' 'armv5' 'armv6' 'armv7' 'armv8')
url='https://github.com/NilsBrause/waylandpp'
licanse=('MIT' 'GPL3')
depends=(wayland)
conflicts=(waylandpp)
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
    ROOT="$pkgdir" PREFIX="/usr" scons install
}

# Local Variables:
# mode: shell-script
# End:
