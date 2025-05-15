#Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=glance-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="A self-hosted dashboard that puts all your feeds in one place"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/glanceapp/glance"
license=('AGPL-3.0-only')
conflicts=('glance')
provides=("glance=${pkgver}")
source=("https://raw.githubusercontent.com/glanceapp/glance/refs/tags/v${pkgver}/docs/glance.yml"
        "glance.service"
        "sysusers.conf"
        "tmpfiles.conf")
b2sums=('c78e93b279833ed3962ee4abd36cc64dcb9ad15f01d00e4f927ce6a809eead1ab96a52529a939d4e7e6b10a544692755f82f5d676a8433d70a605d848e982d86'
        '6c9f854855cf366eb47847f90c8ed38c531a71ef329575863cd570c5dc46849e5f34ae6549ec214652c1413debdf512646775fd163e149b5c89e99511644edf2'
        '4fc636320adf8b7810bd3b4786a6d30f848f6e183a1e351dc3780ea4d66c72ebb96f4fc6e9ed13277a385cbfdd3c07d5e1ec05dc0b12afc3b69270a3c5b7e971'
        'c77dfe04cf5b2f59e919e6dfc5fd85709d5c4bf0f1d83185c15efad2072b6a1389514df5a4ff80920b73690588d373b49e59a36fef2f51fba5bdc06e177dd46e')
b2sums_x86_64=('25131c68af6d17451e8ac34e64871084bc557080a79281a32ca5a1f34d3ca4cb612f1264ddfa3e469f1f31d737f0f433ad3aacb0fa81cc34b9354e8ec5ecd491')
b2sums_i686=('f68f6f68fc41477c8d27308e8357d15dc7638a63476d15a0a1867cd1dc1b9f2610e27a581aea9416e5e6270aa02eda1358b142e7bc611451675317acbfcddc1c')
b2sums_armv7h=('b67ac530ea96c7a9b29d325c63c114fe47fdb65664151813e0d67f3ab92c9f4d41d92d763f1fae2ef076725ebb083c4aeeb27e05bb30026f534c82cc77db41ad')
b2sums_aarch64=('9a13d394a410591fae52ac04021f5e57de451b8639edaf1e7e88147bdcf5e0e5bb710ebdcf185addf07327b3af31d0dc48602d47c27cf4812ad9cac8d11ba2b8')
source_x86_64=("https://github.com/glanceapp/glance/releases/download/v${pkgver}/glance-linux-amd64.tar.gz")
source_i686=("https://github.com/glanceapp/glance/releases/download/v${pkgver}/glance-linux-386.tar.gz")
source_aarch64=("https://github.com/glanceapp/glance/releases/download/v${pkgver}/glance-linux-arm64.tar.gz")
source_armv7h=("https://github.com/glanceapp/glance/releases/download/v${pkgver}/glance-linux-armv7.tar.gz")
backup=('etc/glance.yml')

package() {
    install -Dm755 "glance" "$pkgdir/usr/bin/glance"
    install -Dm644 glance.service "$pkgdir/usr/lib/systemd/system/glance.service"
    install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/glance.conf"
    install -Dm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/glance.conf"
    install -Dm644 "glance.yml" "$pkgdir/etc/glance.yml"
}
