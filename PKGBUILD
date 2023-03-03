# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>
pkgname=ydb-cli-bin
pkgver=2.1.1
pkgrel=2
pkgdesc='YDB CLI is the client-side command line interface for YDB databases.'
arch=('x86_64')
url='https://ydb.tech/en/docs/reference/ydb-cli/'
license=('Apache')
makedepends=('curl')

YDB_STORAGE_URL='https://storage.yandexcloud.net/yandexcloud-ydb'

source=("${YDB_STORAGE_URL}/release/${pkgver}/linux/amd64/ydb")
sha256sums=('8e2540507beb17353b6318815eb0ca5bc8daf61e1b60790d72a4804c1d431dca')

pkgver() {
    curl "${YDB_STORAGE_URL}/release/stable"
}

package() {
    install -D "${srcdir}/ydb" "${pkgdir}/usr/bin/ydb"
}
