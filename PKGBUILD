# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>
pkgname=ydb-cli-bin
pkgver=2.2.0
pkgrel=1
pkgdesc='YDB CLI is the client-side command line interface for YDB databases.'
arch=('x86_64')
url='https://ydb.tech/en/docs/reference/ydb-cli/'
license=('Apache')
makedepends=('curl')

YDB_STORAGE_URL='https://storage.yandexcloud.net/yandexcloud-ydb'

source=("${YDB_STORAGE_URL}/release/${pkgver}/linux/amd64/ydb")
sha256sums=('7b61c47417070bf79ec9202a89fa373fb34e1bb6b1a5bb4f17f4191bc1964487')

pkgver() {
    curl "${YDB_STORAGE_URL}/release/stable"
}

package() {
    install -D "${srcdir}/ydb" "${pkgdir}/usr/bin/ydb"
}
