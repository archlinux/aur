# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>
pkgname=ydb-cli-bin
pkgver=2.1.1
pkgrel=1
pkgdesc='YDB CLI is the client-side command line interface for YDB databases.'
arch=('x86_64')
url='https://ydb.tech/en/docs/reference/ydb-cli/'
license=('Apache')
makedepends=('curl')


YDB_STORAGE_URL='https://storage.yandexcloud.net/yandexcloud-ydb'


source=("${YDB_STORAGE_URL}/release/${pkgver}/linux/amd64/ydb")
sha256sums=('a0647b28931fb41ac803687f6c64557bec9d202fe4453efb2912dd1d9cde9f18')

pkgver() {
    curl "${YDB_STORAGE_URL}/release/stable"
}

package() {
    install -D "${srcdir}/ydb" "${pkgdir}/usr/bin/ydb"
}
