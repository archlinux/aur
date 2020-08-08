# Maintainer: Shadowigor <shadowigorr at gmail dot com>
pkgname="osync"
pkgver=v1.2.r3.c55b39c
pkgrel=1
pkgdesc="A two way filesync script"
arch=("any")
url="https://github.com/deajan/osync"
license=('custom')
depends=('rsync' 'inetutils')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
source=('git+https://github.com/deajan/osync.git#branch=stable')
md5sums=('SKIP')

prepare()
{
    cd "$pkgname"
    find . -type f -exec sed -i "s:/usr/local:/usr:g" {} ";"
    find . -type f -exec sed -i "s:/lib:/usr/lib:g" {} ";"
}

package()
{
    cd "$pkgname"
    echo n | FAKEROOT="$pkgdir" bash ./install.sh > /dev/null
}
