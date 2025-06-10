#Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=glance-bin
pkgver=0.8.4
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
b2sums_x86_64=('2dd0836d0195c16002254a7448d5b71217db6e62bcbd55627a58c05952f73d417e2512c570cae854415c0ba6518d18e28b959328855ba56765d64ab7542bbec7')
b2sums_i686=('4700f7bde958837827e52404b4c640f1bf5d26de34df429fff5ce82c9ff53c000db0fbb70e91b30357d750e87327f746576adf6ec005cd28f2bf93d5ecea635b')
b2sums_armv7h=('6fc70d32c4cc00afe3154d9833265682ee5a1c0ec2381b222caa972c8faa464c40ec09390e035aad8728eb974351543d1a2c0b16ff13028f8959bdd4ad0d5285')
b2sums_aarch64=('d8b3e1aa611d022ece661b90e09699fe1ab4da6bb201c8066fc54e92e1e938c206a9d3d7423d86af622ea73e808b56343416f7f5c360761ddba2cffdd3dbfa03')
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
