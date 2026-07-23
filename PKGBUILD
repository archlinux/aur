# Maintainer: Alois Nespor <info@aloisnespor.info>
# Contributor: Nisel Alexander II (hzs)
# Contributor: aleksonik <imsnet@yandex.ru>

pkgname=hzs_reminder
pkgver=2026.07.23
pkgrel=1
pkgdesc="Lightweight birthday and event reminder using Qt6"
arch=('x86_64')
url="https://github.com/alium/hzs-reminder-qt6"
license=('GPL3')
depends=('qt6-base')
makedepends=('qt6-base')
source=("${url}/archive/refs/tags/qt6-1.0.tar.gz")
sha256sums=('0cbdaa8aefa43ed4b1a1cf05146e3049f27cd869881cef9871230a4e20c9fb13')

build() {
    cd "${srcdir}/hzs-reminder-qt6-qt6-1.0"

    qmake6 \
        QMAKE_CFLAGS_RELEASE="${CPPFLAGS} ${CFLAGS}" \
        QMAKE_CXXFLAGS_RELEASE="${CPPFLAGS} ${CXXFLAGS}" \
        QMAKE_LFLAGS_RELEASE="${LDFLAGS}"

    make -j"$(nproc)"
}

package() {
    cd "${srcdir}/hzs-reminder-qt6-qt6-1.0"

    install -Dm755 reminder "${pkgdir}/usr/bin/reminder"
}
