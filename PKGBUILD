# Maintainer: Xiang Gao <qasdfgtyuiop at gmail dot com>

pkgname=mkinitcpio-docker-hooks
pkgver=1.1
pkgrel=2
pkgdesc="mkinitcpio hooks that provides support for using docker image as root"
arch=(any)
url="https://github.com/zasdfgbnm/mkinitcpio-docker-hooks"
license=('GPL')
groups=('base')
depends=('mkinitcpio')
backup=(etc/docker-btrfs.json)
source=('install_docker-btrfs' 'hooks_docker-btrfs' 'etc_docker-btrfs.json' 'get-docker-cache-id.go')
md5sums=('5ce9a3498b0af7e9fbbe830893da83e3'
         'b44c59a25ef2ff74e60d20aaabe683fd'
         '4df2fd7306aef1e3d94ffc6b05056728'
         'bcae1950b172498e34c1aa4cb55ecad0')

build() {
    go build get-docker-cache-id.go
}

package() {
    install -Dm755 get-docker-cache-id "${pkgdir}/usr/bin/get-docker-cache-id"
    install -Dm644 install_docker-btrfs "${pkgdir}/usr/lib/initcpio/install/docker-btrfs"
    install -Dm644 hooks_docker-btrfs "${pkgdir}/usr/lib/initcpio/hooks/docker-btrfs"
    install -Dm644 etc_docker-btrfs.json "${pkgdir}/etc/docker-btrfs.json"
}
