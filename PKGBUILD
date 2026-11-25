# Maintainer: lingdianshiren <ldsrwu@foxmail.com>

pkgname=srun-portal-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Prebuilt Rust client for Srun portal authentication and reconnect"
arch=('x86_64')
url="https://github.com/lingdiansr/srun-portal"
license=('AGPL-3.0-or-later')
depends=('glibc' 'libgcc')
provides=('srun-portal')
conflicts=('srun-portal')
options=('!strip')
source=("srun-portal-v$pkgver-$CARCH-unknown-linux-gnu::https://github.com/lingdiansr/srun-portal/releases/download/v$pkgver/srun-portal-v$pkgver-$CARCH-unknown-linux-gnu"
        "LICENSE::https://raw.githubusercontent.com/lingdiansr/srun-portal/v$pkgver/LICENSE")
sha256sums=('98402ad0e0bdaf5b546c8a14509156babe7349a7f8922ec87f764fef4a63cd09'
            'd8a6cc31abc16b6748c7a21f21611f5a1ec33f67d22ca23d7da1c19b95496bee')

package() {
  install -Dm755 "$srcdir/srun-portal-v$pkgver-$CARCH-unknown-linux-gnu" \
    "$pkgdir/usr/bin/srun-portal"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
