# Maintainer: Trey Blancher $(base64 -d <<< dHJleUBibGFuY2hlci5uZXQK)
pkgname="newrelic-cli-bin"
_pkg="${pkgname/-bin/}"
pkgver=0.111.0
pkgrel=1
pkgdesc="New Relic:  All-in-One Observability Service - command line tool"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/newrelic/newrelic-cli/"
license=('Apache')
groups=('newrelic')
provides=('newrelic-cli')
conflicts=('newrelic-cli')
#changelog="CHANGELOG"
source_aarch64=("https://github.com/newrelic/newrelic-cli/releases/download/v${pkgver}/${_pkg}_${pkgver}_Linux_arm64.tar.gz"
                "https://github.com/newrelic/newrelic-cli/releases/download/v${pkgver}/${_pkg}_${pkgver}_Linux_arm64.tar.gz.sig")
source_armv7h=("https://github.com/newrelic/newrelic-cli/releases/download/v${pkgver}/${_pkg}_${pkgver}_Linux_armv7.tar.gz"
               "https://github.com/newrelic/newrelic-cli/releases/download/v${pkgver}/${_pkg}_${pkgver}_Linux_armv7.tar.gz.sig")
source_x86_64=("https://github.com/newrelic/newrelic-cli/releases/download/v${pkgver}/${_pkg}_${pkgver}_Linux_x86_64.tar.gz"
               "https://github.com/newrelic/newrelic-cli/releases/download/v${pkgver}/${_pkg}_${pkgver}_Linux_x86_64.tar.gz.sig")
sha256sums_aarch64=('781e2d0e8b2783541ef687882098a571d1565b1b5c244bd09b84c5a417c78e9e'
                    'SKIP')
sha256sums_armv7h=('2992a64ba3bd7339931747526fd4665c750effb86734aa8bfdf025905f2c2024'
                   'SKIP')
sha256sums_x86_64=('5224afef3f70c687690b14982a8e47d4f1fa9b9a7de4cd9098c40b56f91bef2b'
                   'SKIP')
validpgpkeys=("D3EEEEE880A91DEE209A82CC4F9A9B5B96EC30B9")


package() { 
    local _exec=${_pkg//-cli/}
    # Note, newrelic expects to be in /usr/local/bin, newrelic install will
    # fail if it isn't here
    install -Dm u=rwx,go=rx -t "${pkgdir}/usr/local/bin/" "${srcdir}/${_exec}" 
}
