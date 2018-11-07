# Submitter: Kuan-Yen Chou <forendef2846@gmail.com>

pkgname=onos
pkgver=1.14.1
pkgrel=1
pkgdesc='Open Network Operating System'
arch=('x86_64')
url='https://onosproject.org'
license=('Apache')
depends=('jdk8-openjdk' 'curl')
install=onos.install
source=("https://repo1.maven.org/maven2/org/onosproject/onos-releases/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "onos.service")
sha256sums=('b452cf657ddcebf04cc8265bb0bee186559242dfc9cadbf3ea94433e9806f435'
            'c5d5b1c5f21acee1efe8f491a3ee033f56f528d2b41ffe8509b8142bae923759')

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/opt"
    mv "${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
    install -Dm 644 "${srcdir}/onos.service" -t "${pkgdir}/usr/lib/systemd/system"
}

# vim: set ts=4 sw=4 et:
