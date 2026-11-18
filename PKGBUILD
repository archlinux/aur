# Maintainer: Patrick Bergner <aur-contact@rldn.de>
pkgname=bond-bin
pkgver=2.2.0
pkgrel=1
pkgdesc='Encrypted, quantum-safe and repairable backups for storage you have no reason to trust'
arch=('x86_64' 'aarch64')
url='https://github.com/patrickbergner/bond'
# BOND's own license, then the terms of the 7-Zip build embedded in the binary
license=('MIT' 'LGPL-2.1-or-later' 'BSD-3-Clause' 'BSD-2-Clause' 'LicenseRef-unRAR')
provides=("bond=$pkgver")
conflicts=('bond')
# The release binaries are already stripped (-s -w); install them unchanged
options=('!strip' '!debug')
source_x86_64=("$url/releases/download/v$pkgver/bond-$pkgver-linux-amd64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/bond-$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('1be75a2f9471f5fa46243739f0595143c6ad2333b57b8f034beeb7b75ef9ce4e')
sha256sums_aarch64=('9af836c9cb547378116f658e73cbebd036011103c7bcda86c62dc4f645f73dbb')

package() {
    cd "bond-$pkgver"
    install -Dm755 bond -t "$pkgdir/usr/bin"
    install -Dm644 readme.txt config.sample.json -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE LICENSE-7-Zip.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
