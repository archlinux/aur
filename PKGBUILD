#Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=glance-bin
pkgver=0.7.13
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
b2sums=('0baa5f20c637fe3b4e2c4c91c992dd827bbbd7092727e3a9ebeda92d6a766a6cf56d0476930c0f0aa3b63791d13d0ffa752112425b7ed67fa14d8d50a192de4b'
        '6c9f854855cf366eb47847f90c8ed38c531a71ef329575863cd570c5dc46849e5f34ae6549ec214652c1413debdf512646775fd163e149b5c89e99511644edf2'
        '4fc636320adf8b7810bd3b4786a6d30f848f6e183a1e351dc3780ea4d66c72ebb96f4fc6e9ed13277a385cbfdd3c07d5e1ec05dc0b12afc3b69270a3c5b7e971'
        'c77dfe04cf5b2f59e919e6dfc5fd85709d5c4bf0f1d83185c15efad2072b6a1389514df5a4ff80920b73690588d373b49e59a36fef2f51fba5bdc06e177dd46e')
b2sums_x86_64=('214ccd2a26d73d16c3e7b784cd518936483d75245973f6561b2ba7e6bf416fc0b27dc50c3c074a49825e8eb7b132bf727e8ceb0da80a36993988945e95e49372')
b2sums_i686=('a6106a2a0f8d3d5a89ce23db7603e3d6008fe3c9684f02da07cf8712e353f6ad12a443d1bbd6a486114cf29985dcbab13aee04e6875eeaec8f8846bfab6eb2c2')
b2sums_armv7h=('203386e07181d94d79f8384fbbb671104b5b1a1d63bd8e57f2e49020c62932a6471578c851a617fb98128027cd3ef73755991673a7dcfd9cf3adbd5b6c1d8171')
b2sums_aarch64=('4a387d49d89d11c6c4c6ce1cabb65952546c4e86d9dbbdeb3b3224b335125b876da437c4bef9b5f320e630451db2413a65d530595b6ca303102ff1ccecde86d5')
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
