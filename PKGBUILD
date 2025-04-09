#Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=glance-bin
pkgver=0.7.9
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
b2sums_x86_64=('f032a7192416bdd425d381b1d43834bb5d8313a52d661ea9fa07d2f426af4e330dfefe2d64d1b80a63459fd11c89899c22f9e6136c664020e90bacd888a39fed')
b2sums_i686=('f95cacb8f30628477327d0b963fba8192ad657278b173764e546ddf982026e74767414c18fa4460c7d600f07bf4c40dfbe854dfd8f177c2113a5641381ec47f6')
b2sums_armv7h=('9ae7733d9ea8a477b068fcffd72c97793e5ed2a862262b739ba7b23185ac908122fd744c6006d2597b3a6afb57aabc016626377b16daa87f6cfdca664208dd2f')
b2sums_aarch64=('3df95eecefd1181d82e457996e660269c0045cdf08a43097e4df6fee563e0cdcc4bc946a1321ca1ddcd75a5b9b58cbbeacceeaffa9d981e87a073bc20a8468bd')
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
