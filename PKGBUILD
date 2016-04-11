pkgname=systemd-cat-bash
pkgver=20160411.1_0406b78
pkgrel=1
pkgdesc="pass bash output to systemd-cat"
depends=('systemd' 'bash')
arch=('i686' 'x86_64')
license=('custom')

source=(
    "repository::git://github.com/kovetskiy/systemd-cat-bash"
)
md5sums=(
    'SKIP'
)

pkgver() {
    cd "$srcdir/repository"
    local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
    local count=$(git rev-list --count HEAD)
    local commit=$(git rev-parse --short HEAD)
    echo "$date.${count}_$commit"
}

package() {
    cd "$srcdir/repository"
    install -D -m755 systemd-cat-bash "$pkgdir/usr/bin/systemd-cat-bash"
}
