# Maintainer: tailinchu <use_my_id at gmail dot com>

pkgname=sai-git
pkgver=42.a168840
pkgrel=1
pkgdesc="simple arch installer (sai)"
arch=('any')
url="http://github.com/taylorchu/sai"
license=('GPL2')
depends=('syslinux' 'gptfdisk' 'util-linux' 'bash' 'curl')
makedepends=('git')
conflicts=()
provides=()
source=("git://github.com/taylorchu/sai.git")
md5sums=('SKIP')

_gitroot="sai"

pkgver () {
    cd "$srcdir/$_gitroot"
    echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
    cd "$srcdir/$_gitroot"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

