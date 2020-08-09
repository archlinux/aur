# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=yandex-cloud-bin
pkgver=0.61.0
pkgrel=1
pkgdesc='Yandex.Cloud CLI'
arch=('x86_64')
url='https://cloud.yandex.ru/docs/cli/'
license=()
depends=()
makedepends=()
provides=('yandex-cloud')
source=("yc::https://storage.yandexcloud.net/yandexcloud-yc/release/${pkgver}/linux/amd64/yc")
md5sums=('d24b27884e58fae9da9a8faf483f9015')

build(){
    cd "$srcdir"
}

package(){
    mkdir -p "$pkgdir/usr/bin"
    cp "yc" "$pkgdir/usr/bin/yc"
    chmod +x "$pkgdir/usr/bin/yc"

    mkdir -p "$pkgdir/usr/share/bash-completion/completions"
    $pkgdir/usr/bin/yc completion bash > "$pkgdir/usr/share/bash-completion/completions/yc"

    mkdir -p "$pkgdir/usr/share/zsh/site-functions/"
    $pkgdir/usr/bin/yc completion zsh > "$pkgdir/usr/share/zsh/site-functions/_yc"
}
