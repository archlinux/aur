# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>
pkgname=ydb-cli-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='YDB CLI is the client-side command line interface for YDB databases.'
arch=('x86_64')
url='https://ydb.tech/en/docs/reference/ydb-cli/'
license=('Apache')
makedepends=('curl')


YDB_STORAGE_URL='https://storage.yandexcloud.net/yandexcloud-ydb'


source=("${YDB_STORAGE_URL}/release/${pkgver}/linux/amd64/ydb")
sha256sums=('3af7109e5cbb38852116e04e630ed6c3550b3ff984f25c72eb6ee61013ff58e8')

pkgver() {
    curl "${YDB_STORAGE_URL}/release/stable"
}

package() {
    install -D "${srcdir}/ydb" "${pkgdir}/usr/bin/ydb"
}
