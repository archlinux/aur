# Maintainer: Marco Kage <marco.kage at outlook dot com>

pkgname=stash-bin
pkgver=0.28.1
pkgrel=1
pkgdesc="An organizer for your porn, written in Go"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/stashapp/stash'
license=('AGPL3')
provides=('stash')
depends=('ffmpeg')
conflicts=('stash')
source_x86_64=("${pkgname}-${pkgver}::https://github.com/stashapp/stash/releases/download/v${pkgver}/stash-linux")
source_aarch64=("${pkgname}-${pkgver}::https://github.com/stashapp/stash/releases/download/v${pkgver}/stash-linux-arm64v8")
source_armv7h=("${pkgname}-${pkgver}::https://github.com/stashapp/stash/releases/download/v${pkgver}/stash-linux-arm32v7")
sha1sums_x86_64=('6ae0ac8792fd83defaf35e9dc2c0ea039d4ead79')
sha1sums_aarch64=('9850e67589b567540108296c8b9ca36274aae000')
sha1sums_armv7h=('4a0bf2e91ec72f552678a4014030764dc6355a97')

source=("stash.service"
"stash-user.service"
"stash.sysusers"
"stash.tmpfiles"
"stash.env"
)
sha256sums=('06ff18ccab55933fa568a05f280709de839d98979b6cf85217ffb252728b8840'
            '41f79ebc8d24cb1ae87ba55923d56e6d5c6bff9fa62433070fdf37ff5a52f7fd'
            'de94761e4a705c6fa7216359d5286c4724c985818b21ed071d3866246fffd870'
            '7aac9c11831133f271c52bc432bd68a3eeb48afa9f0affa0486e57a693abf862'
            '4f6add7bf6d1be8dc5df5f6117b7288a2c9d4ba97fd784bc05c197673353de85')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/stash"
  install -Dm644 stash.service "${pkgdir}/usr/lib/systemd/system/stash.service"
  install -Dm644 stash-user.service ${pkgdir}/usr/lib/systemd/user/stash.service
  install -Dm644 stash.sysusers "${pkgdir}/usr/lib/sysusers.d/stash.conf"
  install -Dm644 stash.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/stash.conf"
  install -Dm644 stash.env "${pkgdir}/etc/conf.d/stash"
}
