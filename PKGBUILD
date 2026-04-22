# Maintainer: Andrea Cervesato <thekoma@github>
pkgname=tpm-reenroll
pkgver=0.2.0
pkgrel=1
pkgdesc='Auto re-enroll TPM2 for LUKS when PCR policy changes (e.g. after a Secure Boot dbx update)'
arch=('any')
url='https://github.com/thekoma/tpm-reenroll'
license=('MIT')
depends=('systemd>=250' 'cryptsetup' 'coreutils' 'util-linux' 'grep')
optdepends=('sbctl: Secure Boot key management')
install=tpm-reenroll.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/thekoma/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('326ceb3cb24e4e028fe7ae9205245888b44797e6eece681352584e67f7190f96')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
