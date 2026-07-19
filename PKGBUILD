# Maintainer: TheOddCell <rayfb.to.1@gmail.com>
pkgname=germ-git
pkgver=r6.2139a9b
pkgrel=1
pkgdesc="GEneral Resource Monitor"
arch=('any')
url="https://github.com/oversea-suite/germ"
license=('LGPLv2.1')
depends=('bash' 'python' 'probed')
provides=('germ')
conflicts=('germ')
source=("germ-source::git+https://github.com/oversea-suite/germ.git")
sha256sums=('SKIP')

pkgver() {
    cd germ-source
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd germ-source
    install -Dm755 germ          "$pkgdir/usr/bin/germ"
}
