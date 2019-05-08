# Maintainer: Jakub Trnka <jakub.trnka@chainanalytics.net>
# Contributor: Sebastian Jug <seb@stianj.ug>

pkgname=trezor-bridge-bin
pkgver=2.0.26
pkgrel=1
pkgdesc="Communication daemon for TREZOR"
arch=('i686' 'x86_64')
url="https://trezor.io/"
license=('LGPL3')
depends=('systemd')
makedepends=()
options=()
install=$pkgname.install
source_i686=("https://wallet.trezor.io/data/bridge/${pkgver}/trezor-bridge_${pkgver}_i386.deb")
source_x86_64=("https://wallet.trezor.io/data/bridge/${pkgver}/trezor-bridge_${pkgver}_amd64.deb")
sha256sums_i686=('4928ca508eec302afc562ba2a4142c74d172b6baa942a6a05b34947a24bc5185')
sha256sums_x86_64=('d5e7068eb196bfa6c4a68ba9523506339a563e773277f03189736d252161bbd7')

package() {
    msg2 "Extracting the data..."
    bsdtar -xf data.tar.gz -C "$pkgdir/"

    msg2 "Fixing file structure..."
    mv "$pkgdir"/lib/udev "$pkgdir"/usr/lib/
    
    msg2 "Cleaning up..."
    rm -r "$pkgdir"/lib/
}
