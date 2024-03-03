# Maintainer: Bruce Patterson <contact at bpatterson dot dev>
pkgname='mqtt_vault-bin'
pkgver=1.0.2
pkgrel=1
pkgdesc='JSON database controlled via MQTT'
arch=('x86_64')
url='https://bpatterson.dev/projects/mqtt_vault'
license=('MPL2')
depends=('openssl>=3' 'gcc-libs' 'glibc')
provides=('mqtt_vault')
conflicts=('mqtt_vault')
options=('zipman')
backup=('usr/share/mqtt_vault/mqtt_vault.conf.sample')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/bpatterson-gh/MqttVault/releases/download/v$pkgver/mqtt_vault-$pkgver-Arch.tar.gz")
sha256sums=('df9a96155cad97db1808a712cab5c804b9b7f68f47ebb99841d435597a86d57f')

package() {
    cd "$srcdir/mqtt_vault-$pkgver-Arch/"
    install -Dm755 -t "$pkgdir/usr/bin/" "usr/bin/mqtt_vault"
    mkdir -p -m 755 "$pkgdir/usr/share/man/man1/"
    install -m644 -t "$pkgdir/usr/share/man/man1/" "usr/share/man/man1/mqtt_vault.1"
    mkdir -p -m 755 "$pkgdir/usr/share/mqtt_vault/"
	install -m664 -t "$pkgdir/usr/share/mqtt_vault/" "usr/share/mqtt_vault/mqtt_vault.conf.sample"
}

