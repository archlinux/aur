# Maintainer: yuna0x0 <yuna@yuna0x0.com>

pkgname=docker-credential-atcr-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Docker credential helper for ATCR (AT Container Registry)"
arch=('x86_64' 'aarch64')
url="https://atcr.io"
license=('MIT')
provides=("docker-credential-atcr=$pkgver-$pkgrel")
conflicts=('docker-credential-atcr')
options=('!strip' '!debug')
_repo="https://tangled.org/did:plc:pddp4xt5lgnv2qsegbzzs4xg/at-container-registry"
# The release archives ship no licence, so fetch it from the tag.
source=("$pkgname-$pkgver-LICENSE::$_repo/raw/v$pkgver/license")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$_repo/tags/v$pkgver/download/docker-credential-atcr_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$_repo/tags/v$pkgver/download/docker-credential-atcr_${pkgver}_Linux_arm64.tar.gz")
sha256sums=('aff5fbb8e2002841738321c8127c27e58f3228b319a54512f521ddba2e883cc7')
sha256sums_x86_64=('3037273abc84d1707d0c4746441337022d4dd23b4b94b5929439d6df42f407da')
sha256sums_aarch64=('831a9b388f6eed6e5619922c71d82b090b65297f0980cb2b462c82dd129b299b')

package() {
    install -Dm755 "$srcdir/docker-credential-atcr" "$pkgdir/usr/bin/docker-credential-atcr"
    install -Dm644 "$srcdir/$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/INSTALLATION.md" "$pkgdir/usr/share/doc/$pkgname/INSTALLATION.md"
}
