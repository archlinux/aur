# Maintainer: Bruce Patterson <contact at bpatterson dot dev>
pkgname='mqtt_vault-bin'
pkgver=1.0.1
pkgrel=1
pkgdesc='JSON database controlled via MQTT'
arch=('x86_64')
url='https://bpatterson.dev/projects/mqtt_vault'
license=('MPL2')
depends=('openssl>=3' 'gcc-libs' 'glibc')
provides=('mqtt_vault')
conflicts=('mqtt_vault')
backup=('usr/share/mqtt_vault/mqtt_vault.conf.sample')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/bpatterson-gh/MqttVault/releases/download/v1.0.0/mqtt_vault-$pkgver-Arch.tar.gz")
sha256sums=('f79ea88494895c76b88565d71f91848716bf421129ce33c687b1e900837c16fb')

package() {
    cd "$srcdir/mqtt_vault-$pkgver-Arch/"
    install -Dm755 -t "$pkgdir/usr/bin/" "usr/bin/mqtt_vault"
    mkdir -p -m 755 "$pkgdir/usr/share/man/man1/"
    install -m644 -t "$pkgdir/usr/share/man/man1/" "usr/share/man/man1/mqtt_vault.1.gz"
    mkdir -p -m 755 "$pkgdir/usr/share/mqtt_vault/"
	install -m664 -t "$pkgdir/usr/share/mqtt_vault/" "usr/share/mqtt_vault/mqtt_vault.conf.sample"
}

