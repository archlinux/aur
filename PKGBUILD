# Ex-Maintainer: Leonardo Eugenio <lelgenio@disroot.org>
# Mantainer: Darvin Delgado <dnmodder at gmail dot com>

pkgname=mscs
pkgver=23.11.00
pkgrel=1
pkgdesc="Powerful command-line control for UNIX and Linux powered Minecraft servers"
arch=('any')
url="https://github.com/MinecraftServerControl/mscs"
license=('BSD-2-Clause')
depends=('screen' 'perl-json' 'perl-lwp-protocol-https' 'java-runtime' 'rsync' 'socat')
makedepends=(make git)
optdepends=(
    'python: Overviewer mapping tool'
    'iptables: Recommended firewall'
    'rdiff-backup')
install=mscs.install
source=(
    "${pkgname}-v.${pkgver}.tar.gz::${url}/archive/refs/tags/v.${pkgver}.tar.gz"
    "mscs.install")
md5sums=(
    '0b56de7f407947ec7ab78c322f398695'
    'c7a43225791cbd192277b0fd09fb6887')

package() {
    cd "${pkgname}-v.${pkgver}"

    install -Dm 0755 msctl ${pkgdir}/usr/local/bin/msctl
    install -Dm 0755 mscs ${pkgdir}/usr/local/bin/mscs
    install -Dm 0644 mscs.completion ${pkgdir}/etc/bash_completion.d/mscs
    install -Dm 0644 mscs.service ${pkgdir}/etc/systemd/system/mscs.service
    install -Dm 0644 mscs@.service ${pkgdir}/etc/systemd/system/mscs@.service
    install -D LICENSE ${pkgdir}/usr/share/licenses/mscs/LICENSE
}
