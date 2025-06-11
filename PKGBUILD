# Maintainer: Youn Mélois <youn@melois.dev>
pkgname=fdbbackup-bin
pkgver=7.3.63
pkgrel=1
pkgdesc='FoundationDB is a scalable, fault-tolerant, ordered key-value store with full ACID transactions.'
arch=('x86_64')
url='https://www.foundationdb.org/'
license=('Apache-2.0')
groups=('foundationdb')
provides=(
    "fdbbackup=${pkgver}"
    "fdbrestore=${pkgver}"
    "fdbdr=${pkgver}"
    "dr_agent=${pkgver}"
)
conflicts=('foundationdb-clients-bin')
options=('!debug')
source_x86_64=("https://github.com/apple/foundationdb/releases/download/${pkgver}/fdbbackup.x86_64")
sha256sums_x86_64=('e3b425d544f3133900928bdb94f33521faa3cc205e09287e26068aef2ecde408')

package() {
    install -dm755 "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/fdbbackup.x86_64" "${pkgdir}/usr/lib/foundationdb/backup_agent/backup_agent"

    ln -s /usr/lib/foundationdb/backup_agent/backup_agent "${pkgdir}/usr/bin/fdbbackup"
    ln -s /usr/lib/foundationdb/backup_agent/backup_agent "${pkgdir}/usr/bin/fdbrestore"
    ln -s /usr/lib/foundationdb/backup_agent/backup_agent "${pkgdir}/usr/bin/fdbdr"
    ln -s /usr/lib/foundationdb/backup_agent/backup_agent "${pkgdir}/usr/bin/dr_agent"
}
