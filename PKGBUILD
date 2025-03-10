#Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=glance-bin
pkgver=0.7.3
pkgrel=2
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
b2sums_x86_64=('da7d8824c6325790accc7a245c7c3e57920db466b751ffe0ba981c1f3e6e9970cf383f0f887edd1cdced2d30567b63cedd05430d61ffa202c5917fbd8e43d4ff')
b2sums_i686=('a579e44921c9da423e1d019dd19c67512e15cca8a43ce2d43c263f5eb5078835b461fcdc68a4a9aae0bfe085891e6727c4a514c239ae3f3f28de9ee4e053ba34')
b2sums_armv7h=('d2b8ad65eb21d2c35b92382d8d720b072f2a9917cb4d1324475d96fe24f464533b0bbf9d9a2145ceb22c837478cdd443ae7056a6877ab23324590eb93f597f81')
b2sums_aarch64=('531ae99c8c2fc1d9df6e85b0cf332518da7d7a0b0c193f0b96daab1cde2501c37819dabc9bb62643320904ef6b7980c0c1dd8491738169e7e4af98aa2470a51f')
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
