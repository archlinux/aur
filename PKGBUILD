#Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=glance-bin
pkgver=0.8.3
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
b2sums_x86_64=('8fd6ce4f0290ef453f11dc2e0d9f39a93bc02772e668c65d49943bdbadbc4383055a5ee0ef1a119bc37393bf02c21519a05a86acf7975c7295d70ce8bf64b495')
b2sums_i686=('24ab299ae63b8f91385d663058884a8ea58fb87d242cf4cfc7c9aff12df8566b3819990179287be4d51d11ca02853308c574e44a178a048da8b95527cd81f173')
b2sums_armv7h=('d961568cc44f54fe96f736973410f8f7980be1f6a960d4e38ead32962fe8d347db53b18a95644e5b7038d084ab54d7cb754c65076b9fbc3a010afd2b7cc1a31e')
b2sums_aarch64=('b2faef4015e950fe2b9ee0d65319e3e3ae08e5dc450235dc5a1fc17fb1925776320b1352a0389ec9136c1a62779b1d84b86ea638cc6580809230e8881a035722')
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
