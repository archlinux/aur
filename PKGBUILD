# Maintainer: Trey Blancher $(base64 -d <<< dHJleUBibGFuY2hlci5uZXQK)
pkgname="newrelic-cli-bin"
_pkg="${pkgname/-bin/}"
pkgver=0.97.1
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
sha256sums_aarch64=('8aa465e92df694661347df6b5fcbf85498431603a554a018c521cb9715a1c919'
                    'SKIP')
sha256sums_armv7h=('a359dd69b5a090e097aaabf2d1b55fd027ce70c1c078d668cb837a19e0eff118'
                   'SKIP')
sha256sums_x86_64=('89362c0345f4d803b4be9e7a7764fcecdec0647b264a5454da0de1e5405212f7'
                   'SKIP')
validpgpkeys=("5961D131BB2C5C6B42B14D0F92ADA76A30A3F1FD")


package() { 
    local _exec=${_pkg//-cli/}
    # Note, newrelic expects to be in /usr/local/bin, newrelic install will
    # fail if it isn't here
    install -Dm u=rwx,go=rx -t "${pkgdir}/usr/local/bin/" "${srcdir}/${_exec}" 
}
