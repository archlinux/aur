# Maintainer: SiHuan <sihuan at sakuya.love>
_pkgname=dockfmt
pkgname=$_pkgname-git
pkgver="r59.1455059"
pkgrel=2
pkgdesc='Dockerfile format and parser. Like `gofmt` but for Dockerfiles.'
arch=('x86_64')
url="https://github.com/jessfraz/$_pkgname"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    # export GOPROXY=https://goproxy.cn,direct
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"}
}
