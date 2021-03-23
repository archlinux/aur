# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=blocky-bin
pkgver=0.13
pkgrel=1
pkgdesc='Fast and lightweight DNS proxy as ad-blocker'
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h')
url='https://github.com/0xERR0R/blocky'
license=('Apache')
provides=('blocky')
backup=('etc/blocky/blocky.yml')
source=('blocky.yml'
        'blocky.service'
        'blocky.sysusers')
source_x86_64=("https://github.com/0xERR0R/blocky/releases/download/v${pkgver}/blocky_v${pkgver}_linux_amd64")
source_aarch64=("https://github.com/0xERR0R/blocky/releases/download/v${pkgver}/blocky_v${pkgver}_linux_arm64")
source_armv6h=("https://github.com/0xERR0R/blocky/releases/download/v${pkgver}/blocky_v${pkgver}_linux_arm32v6")
source_armv7h=("https://github.com/0xERR0R/blocky/releases/download/v${pkgver}/blocky_v${pkgver}_linux_arm32v6")
sha256sums=('3fec7b35def7cdc5f9d296b3fc70b40f0c2af189b3b4d54ee5867a2dee007bdb'
            '61b5efedf88a95fd2bde8f69fce8a3692bcff29cab4b218603b376a5509accc5'
            '8ef3cfa71ee8d2ad427dc5d83df7967a6b3e6e1dfafaec8cb4520e7269c2471b')
sha256sums_x86_64=('00178cc57d8fbbf8bd9d7d16c0825151a8482fa22aae0a7739903c79ab3043f2')
sha256sums_aarch64=('b66eb3f68fa5d6890da9b454626a6b4af78bb9f871937ef21c0d447e638cd2c7')
sha256sums_armv7h=('abcfca7958831c6f58ad070cdc6095ff5672da903aec5fcf17d09fc2fe3b7858')
sha256sums_armv6h=('abcfca7958831c6f58ad070cdc6095ff5672da903aec5fcf17d09fc2fe3b7858')

package() {
        cd "$src"
        install -Dm 755 blocky_v${pkgver}_linux_* "$pkgdir"/usr/bin/blocky
        install -Dm 644 blocky.yml "$pkgdir"/etc/blocky/blocky.yml
        install -Dm 644 blocky.service "$pkgdir"/usr/lib/systemd/system/blocky.service
        install -Dm 644 blocky.sysusers "$pkgdir"/usr/lib/sysusers.d/blocky.conf
}
