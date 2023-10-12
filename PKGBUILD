# Maintainer: Shadowigor <shadowigorr at gmail dot com>
pkgname="osync"
pkgver=v1.3
pkgrel=1
pkgdesc="A two way filesync script"
arch=("any")
url="https://github.com/deajan/osync"
license=('custom')
depends=('rsync' 'inetutils')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
source=('git+https://github.com/deajan/osync.git#tag=v1.3')
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
    echo n | bash ./install.sh --prefix="$pkgdir" > /dev/null
}
