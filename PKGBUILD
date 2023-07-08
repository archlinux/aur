# Maintainer: Yufan You <ouuansteve at gmail.com>

pkgname=noi-despised-git
pkgver=r55.42aca8a
pkgrel=1
pkgdesc='NOI 背笔试工具'
arch=('x86_64')
url='https://github.com/ouuan/Despised'
license=('MIT')
makedepends=('git')
provides=('noi-despised')
conflicts=('noi-despised')
source=('git+https://github.com/ouuan/Despised.git')
md5sums=('SKIP')

pkgver() {
    cd Despised
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd Despised
    make
}

package() {
    cd Despised
    install -Dm755 despised "$pkgdir/usr/bin/despised"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
