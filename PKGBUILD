# Maintainer: TheRobinHood <ping@ansari.wtf>
pkgname=ufwall
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal UI for managing UFW (Uncomplicated Firewall)"
arch=('x86_64' 'aarch64')
url="https://github.com/The-Robin-Hood/ufWall"
license=('MIT')
depends=('ufw')
provides=('ufwall')
conflicts=('ufwall' 'ufwall-git')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/The-Robin-Hood/ufWall/releases/download/v${pkgver}/ufWall-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/The-Robin-Hood/ufWall/releases/download/v${pkgver}/ufWall-linux-arm64")
noextract=("${pkgname}-${pkgver}-x86_64" "${pkgname}-${pkgver}-aarch64")
sha256sums_x86_64=('3a92083df32fe6f78c0d31ca51ff55ca4b9bb232a7a32ced1f9e798458a1bd60')
sha256sums_aarch64=('2c2823191d5eb4540cfcf5fe837c7e2f6d00799f5d8b8ea497dff3a95824b1e5')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/ufWall"
}
