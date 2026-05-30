#Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=glance-bin
pkgver=0.8.5
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
        '813fc617ce94ace9f4b5e716072a481de01c0c579f4658bf0e52ad09a18a2347c2417ce605a4d09121db78692c127e41686d50d2bd46b8df888717f4ae64b022'
        '4fc636320adf8b7810bd3b4786a6d30f848f6e183a1e351dc3780ea4d66c72ebb96f4fc6e9ed13277a385cbfdd3c07d5e1ec05dc0b12afc3b69270a3c5b7e971'
        'c77dfe04cf5b2f59e919e6dfc5fd85709d5c4bf0f1d83185c15efad2072b6a1389514df5a4ff80920b73690588d373b49e59a36fef2f51fba5bdc06e177dd46e')
b2sums_x86_64=('921749e413472b94b9924ec1eac9697d2e566559dcef775d58027846da6c8e47eec1611f5d378bdba5f01fd88a5d10f5bee568430976216ac93e4023ef64d723')
b2sums_i686=('cad6a48a406b4da2c9010537cda894cc0ae9c0e461f13c88d97dc3422bf617ff50de02fcbe942b017872bbed16a705191b66de2ab849b410b6a9c648cff1d9b3')
b2sums_armv7h=('9cc155115bbd0c65629c97ebe69f593ed206724d9938e677ad38e42f53c2ac66143a63fa7e55ee65b7c03e868ccf102987a63b4181d8b55c50aa3176d359a6d9')
b2sums_aarch64=('9372c9e1199049846ca3de0c487c4361f7187f36b4ccf281e3db4a57af6094068b9228490a77457940dd1feb2725d255df18ac73807c857a38f1a49e1d5e2858')
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
