# Maintainer: Trey Blancher $(base64 -d <<< dHJleUBibGFuY2hlci5uZXQK)
pkgname="newrelic-cli-bin"
_pkg="${pkgname/-bin/}"
pkgver=0.111.2
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
sha256sums_aarch64=('84d402f09f44ba22ac1febefae188ed01c6ab785ca034fcbcebc4c4105107f44'
                    'SKIP')
sha256sums_armv7h=('25a941c88914988e7a23fd99abe39f7f2e9ca0ff87d8b440f32e2bf9781a31aa'
                   'SKIP')
sha256sums_x86_64=('714801b44a82c4a8e090bea9af870cac7ed2dadf789cf431e4b42cf6d4cb1e01'
                   'SKIP')
validpgpkeys=("D3EEEEE880A91DEE209A82CC4F9A9B5B96EC30B9")


package() { 
    local _exec=${_pkg//-cli/}
    # Note, newrelic expects to be in /usr/local/bin, newrelic install will
    # fail if it isn't here
    install -Dm u=rwx,go=rx -t "${pkgdir}/usr/local/bin/" "${srcdir}/${_exec}" 
}
