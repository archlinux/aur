# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Andrew Lorimer <andrew@lorimer.id.au>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=listmonk-bin
pkgver=4.1.0
pkgrel=1
pkgdesc='Self-hosted newsletter and mailing list manager with a modern dashboard (binary release)'
url="https://github.com/knadh/listmonk"
license=('AGPL-3.0-or-later')
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
depends=('postgresql')
provides=("listmonk")
conflicts=("listmonk" "listmonk-git")
options=("!strip" "!debug")
backup=("etc/listmonk/config.toml")
install="listmonk.install"
source=("listmonk-$pkgver.toml::$url/raw/v$pkgver/config.toml.sample"
        "listmonk.conf"
        "listmonk.service")
sha256sums=('5ab5c9c813b826d331d9ffdd7d2462cf1fe57db3918d4b1d636620c3968e430f'
            '5cfc186438df2408ed88a5bec3a9a4b5f2afb0d3aec41c4cc63b2f5eb810b3cb'
            '4852f206b7763ba047ba123d663cadb806f437967154ebe837845198b3266533')
sha256sums_x86_64=('8d40bbb6a39d4db629bf3aca00aaa8326be64f72a64bcc5acc143a9bd341f420')
sha256sums_aarch64=('14179883b60d8b35fd4c494d5cd73a03750aa2110610e743174d026491799c64')
sha256sums_armv6h=('864e9d1288883cf1fbe307736b176030bea774046125e39e9e61568782ff81f4')
sha256sums_armv7h=('d30b26de63c1aa5ffbec6cee4348f28e0a57015e40b95f8c04c6f8138c0794d5')

source_x86_64=("$url/releases/download/v${pkgver}/listmonk_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$url/releases/download/v${pkgver}/listmonk_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("$url/releases/download/v${pkgver}/listmonk_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("$url/releases/download/v${pkgver}/listmonk_${pkgver}_linux_armv7.tar.gz")


package() {
  install -Dm644 listmonk-$pkgver.toml "$pkgdir/etc/listmonk/config.toml"
  install -Dm644 listmonk.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 listmonk.conf -t "$pkgdir/usr/lib/sysusers.d"
  install -Dm755 listmonk -t "$pkgdir/usr/bin"
}
