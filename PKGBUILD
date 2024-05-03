# Maintainer: Trey Blancher $(base64 -d <<< dHJleUBibGFuY2hlci5uZXQK)
pkgname="newrelic-cli-bin"
_pkg="${pkgname/-bin/}"
pkgver=0.84.2
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
sha256sums_aarch64=('b0e730b3399f1a169db9bd9580125ec3d27256deed5ba3163325ae0c9db1f253'
                    'SKIP')
sha256sums_armv7h=('a4fe7fc2830447f79516b2b49700c60d8755184ddeefaec84af3d61461cc8ef1'
                   'SKIP')
sha256sums_x86_64=('0e32b1ec304a10a97f0b597effff1896ade6723186e15b14b9027cf5b110a677'
                   'SKIP')
