# Maintainer: Andrea Cervesato <thekoma@github>
pkgname=tpm-reenroll
pkgver=0.1.0
pkgrel=1
pkgdesc='Auto re-enroll TPM2 for LUKS when PCR policy changes (e.g. after a Secure Boot dbx update)'
arch=('any')
url='https://github.com/thekoma/tpm-reenroll'
license=('MIT')
depends=('systemd>=250' 'cryptsetup' 'coreutils' 'util-linux' 'grep')
optdepends=('sbctl: Secure Boot key management')
install=tpm-reenroll.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/thekoma/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('54a94a4e98dbf0a77ea6519189bbf6b4343da6828968d46890d5d14e92b569e0')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
