# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Andrew Lorimer <andrew@lorimer.id.au>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=listmonk-bin
pkgver=4.0.1
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
sha256sums_x86_64=('227e66e8558a888d2b4ff591c498c24f3e939d8dd1e85545af4cbdf50bc65f29')
sha256sums_aarch64=('877922fa3bcc91ffeea11fdc4b8dafb31edf3677310c15576e815f4009cd0641')
sha256sums_armv6h=('e7182171a3d0fdca98e87d4ca79992721ec7112482bb38c02853d51bd2a6548b')
sha256sums_armv7h=('43469a43f97ab0668ca3b8e13cd5af5260bf282cfe09288107283a4d411b17d5')

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
