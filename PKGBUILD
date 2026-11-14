# Maintainer: Audiolinux  audiolinux@fastmail.fm

pkgname=tune-bridge
pkgver=0.2.8
pkgrel=1
pkgdesc="Open Advanced Audio Transport. A bit-perfect, multi-room audio streaming protocol"
arch=('x86_64' 'aarch64')
url="https://mozaiklabs.fr/"
license=('CSL 1.0')
depends=('alsa-lib' )
source=('endpoint.toml' 'LICENSE-SPEC.md' 'oaat-endpoint.service' 'sysusers.d' 'tmpfiles.d')
source_x86_64=("https://github.com/renesenses/oaat/releases/download/v$pkgver/tune-bridge-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/renesenses/oaat/releases/download/v$pkgver/tune-bridge-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('0515a5b78bec4857bd820d86d91da631eaea096a8971e7cf5faed33610f33ae8' '8d41aeac9299be2eaf17339a88df0e636bc22ddfdf69540c603905b37bac5607' 'bfdf3f42d3c512a9f1eb355dba56e3f397c0ad872d6e5e7a9966303c101668b0' 'ea2a97dca78b25341876c1d62b66a9561a7fd40197137b0e104c565b25d59cf4' '6e7a92685d8020446dd929c6da56a69f5d2e82d40d90cf82c43607b559943396')
sha256sums_x86_64=('262042f87a75844ea467e8b51eb5bbf9339484befa3a64eca82ff5d1fe894e43')
sha256sums_aarch64=('be620bc676cd4157e67bec43620c5608eab6093c560e09e09592722026b406c2')
install=$pkgname.install
backup=(etc/default/tune-bridge)

package() {
install -Dm755 tune-bridge $pkgdir/opt/tune-bridge/tune-bridge
install -Dm644 endpoint.toml $pkgdir/opt/tune-bridge/endpoint.toml
install -Dm644 oaat-endpoint.service $pkgdir/usr/lib/systemd/system/oaat-endpoint.service 
install -Dm644 tmpfiles.d $pkgdir/usr/lib/tmpfiles.d/tune-bridge.conf
install -Dm644 sysusers.d $pkgdir/usr/lib/sysusers.d/tune-bridge.conf
install -Dm644 LICENSE-SPEC.md $pkgdir/usr/share/licenses/tune-bridge/LICENSE-SPEC.md
}
