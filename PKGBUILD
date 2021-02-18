# Maintainer: Antoine Olivier <https://toinane.crea-th.at>
# Contributor: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=colorpicker-fr
_pkgname=colorpicker
pkgver=2.0.3
pkgrel=1
pkgdesc="A mininal but complete colorpicker desktop app"
arch=('x86_64')
url="https://colorpicker.fr/"
license=('GPLv3')
depends=('gtk3' 'libnotify' 'libnss_nis' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'at-spi2-atk' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
source=("https://github.com/Toinane/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=("dc7bc68fd2f6ea5fb12a67eab2c75d7977e8c5a48ebdd5f1ff74f8b8e6563ad4")

prepare() {
    mkdir -p "$pkgname-$pkgver"
    tar -xvf data.tar.xz -C "$pkgname-$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    cp -dpr --no-preserve=ownership opt usr "$pkgdir"
    install -d "$pkgdir/usr/bin"
}
