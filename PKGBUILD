# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=teleconsole-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Command line tool to share your UNIX terminal and forward local TCP ports to people you trust."
arch=('x86_64' 'arm')
url="https://github.com/gravitational/teleconsole/"
license=('Apache')
depends=('glibc')
source_x86_64=(
    "https://github.com/gravitational/teleconsole/releases/download/${pkgver}/teleconsole-v${pkgver}-linux-amd64.tar.gz"
    )
sha256sums_x86_64=(
    'f444828117f2aa8555ec33abd03ef1caadbc72d0f5bc273c48334c55318aafeb'
    ) 
source_arm=(
    "https://github.com/gravitational/teleconsole/releases/download/${pkgver}/teleconsole-v${pkgver}-linux-arm.tar.gz"
    )
sha256sums_arm=(
    'f39244db0d04ee42efb9e6a0a98a861b69e448b10b4eecd52923d1c870337ff5'
    )
options=(!strip)

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 -t "$pkgdir/usr/bin" teleconsole
    # no man pages, docs or web assets in release tarball
}
