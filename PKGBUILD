# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: system72 <system72@waifu.club>
# Contributor: Joshua Smith <smolsheep@opensuse.org>

pkgname=iamb-bin
pkgver=0.13.1
pkgrel=1
pkgdesc="A Matrix client for Vim addicts"
url="https://github.com/ulyssa/iamb"
arch=('x86_64')
license=('Apache-2.0')
depends=('hicolor-icon-theme')
conflicts=('iamb')
provides=('iamb')
options=('!debug')
source=("https://github.com/ulyssa/iamb/releases/download/v${pkgver}/iamb-${pkgver}-${CARCH}-unknown-linux-musl.tar.gz")
b2sums=('55a258c420cf8771c22ffb829eefa4bd5a5ac70c285d8c13689e08523e1028a452907b8f18c21a5f325560e1ffba8a3c6df410308c99d1bc7a859a38d920ab03')

package() {
    cd iamb-${pkgver}
    install -vDm 644 -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}" LICENSE
    install -vDm 644 -t "${pkgdir}/usr/share/man/man1/" docs/iamb.1
    install -vDm 644 -t "${pkgdir}/usr/share/man/man5/" docs/iamb.5
    install -vDm 644 -t "${pkgdir}/usr/share/doc/${pkgname%-bin}" assets/config.example.toml
    install -vDm 644 -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/" assets/iamb.svg
    install -vDm 644 -t "${pkgdir}/usr/share/metainfo/" assets/iamb.metainfo.xml
    install -vDm 644 -t "${pkgdir}/usr/share/applications/" assets/iamb.desktop
    install -vDm 755 -t "${pkgdir}/usr/bin" iamb
}
