#Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=glance-bin
pkgver=0.7.6
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
b2sums_x86_64=('3a4ac390741ef0eb3c676c3b2afd5682bec5b4fbf38dcd27c2d89b85d406a086aeb086924e45a9ff5505eef81f377de570c0bde739b1a668fb60f5463182872d')
b2sums_i686=('9ed42a381ce2a1b385c4adb96c417225d6518ec346a27eac2e313510451ad8d994da08cacec65b4dc134ea673dd420196e3b881505421fdd8fda6e634d1f22d6')
b2sums_armv7h=('b12662cbc3526c3bb3df7bb792224d4c1bb4394800ba774441d0b7ffb7883754dead679f3076349729ca8434096667350286d861642850d9fcbd288ffb927ccb')
b2sums_aarch64=('5d3e2c242278179882544a5d35fcc862c619ed44b966fa6b0a0155a59eb2001a8548f07231c94417ee53874dfbd2589774eefccc946e228e9aa00ccd11c763cb')
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
