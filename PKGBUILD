# Maintainer: Trey Blancher $(base64 -d <<< dHJleUBibGFuY2hlci5uZXQK)
pkgname="newrelic-cli-bin"
_pkg="${pkgname/-bin/}"
pkgver=0.90.0
pkgrel=1
pkgdesc="New Relic:  All-in-One Observability Service - command line tool"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/newrelic/newrelic-cli/"
license=('Apache')
groups=('newrelic')
provides=('newrelic-cli')
conflicts=('newrelic-cli')
changelog="CHANGELOG"
source_aarch64=("https://github.com/newrelic/newrelic-cli/releases/download/v${pkgver}/${_pkg}_${pkgver}_Linux_arm64.tar.gz"
                "https://github.com/newrelic/newrelic-cli/releases/download/v${pkgver}/${_pkg}_${pkgver}_Linux_arm64.tar.gz.sig")
source_armv7h=("https://github.com/newrelic/newrelic-cli/releases/download/v${pkgver}/${_pkg}_${pkgver}_Linux_armv7.tar.gz"
               "https://github.com/newrelic/newrelic-cli/releases/download/v${pkgver}/${_pkg}_${pkgver}_Linux_armv7.tar.gz.sig")
source_x86_64=("https://github.com/newrelic/newrelic-cli/releases/download/v${pkgver}/${_pkg}_${pkgver}_Linux_x86_64.tar.gz"
               "https://github.com/newrelic/newrelic-cli/releases/download/v${pkgver}/${_pkg}_${pkgver}_Linux_x86_64.tar.gz.sig")
validpgpkeys=("5961D131BB2C5C6B42B14D0F92ADA76A30A3F1FD")


package() { 
    local _exec=${_pkg//-cli/}
    # Note, newrelic expects to be in /usr/local/bin, newrelic install will
    # fail if it isn't here
    install -Dm u=rwx,go=rx -t "${pkgdir}/usr/local/bin/" "${srcdir}/${_exec}" 
}
sha256sums_aarch64=('6db0624d71183f1212284388e7d030f43d5813419f0c933bbafcd0242e285c4e'
                    'SKIP')
sha256sums_armv7h=('ac0168ec869f92f7455d496563c7faddf6075d8fbd0c5562c07e432c3c0ed6b0'
                   'SKIP')
sha256sums_x86_64=('fe65a7ae5236ea08bebf13acd54878b858ae0838f49cb8c91e9faa17e68c2313'
                   'SKIP')
