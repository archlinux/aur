# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=celeste-client-bin
pkgver=0.4.6
pkgrel=1
pkgdesc="GUI file synchronization client that can sync with any cloud provider "
arch=(x86_64)
url="https://github.com/hwittenborn/celeste"
license=(GPL3)
depends=(libadwaita rclone)
optdepends=()
makedepends=(squashfs-tools)
provides=(celeste celeste-client)
conflicts=(celeste celeste-client)
source=(celeste-client.desktop
        celeste-client.svg)
_snap=a9zAmHVl4doDwIGkptVyA7VI7fMlPPpE_21
source_x86_64=("celeste-client-${pkgver}.snap::https://api.snapcraft.io/api/v1/snaps/download/${_snap}.snap")
sha256sums=('4fc8f7a5e49e73c83c4f9d25b77f684adec2222aa09acf17e7884f3f5db3f928'
            'e05c6fdac80934ce80f2e25a494b4f82e3784e760afb0b77bdc63c28f86a9896')
sha256sums_x86_64=('d7dbe95862f6c6c08cf44c34e8da98425efda4b6bf82a3acc96063157d99198f')

build() {
  unsquashfs -f "celeste-client-${pkgver}.snap"
}

package() {
  install -D squashfs-root/usr/bin/celeste ${pkgdir}/usr/bin/celeste-client
  install -D celeste-client.desktop -t ${pkgdir}/usr/share/applications
  install -D celeste-client.svg -t ${pkgdir}/usr/share/icons/hicolor/scalable/apps
}
