# Maintainer: jeryd leuck <jerydleuck@gmail.com>
pkgname=msty-claw
pkgver=0.6.0
pkgrel=1
pkgdesc="Msty Claw is an autonomous AI agent application (Beta)"
arch=('x86_64')
url="https://msty.ai/claw"
license=('proprietary')
depends=('gtk3' 'webkit2gtk-4.1' 'openssl' 'libdbus' 'libglvnd')
provides=('msty-claw')
conflicts=('msty-claw')
filename="MstyClaw_amd64_${pkgver}.deb"
source=("$filename::https://next-assets.msty.studio/mstyclaw/latest/linux/MstyClaw_amd64.deb?ver=$pkgver")
sha256sums=('d9e0871816e7e46595639dbafa3f32f6300c674d2eb3442b3d6895582edbe95c')

package() {
  # Extract data.tar.gz from the debian package
  bsdtar -xOf "$srcdir/$filename" data.tar.gz | bsdtar -C "$pkgdir" -xv

  # Create symlink for terminal access
  install -d "$pkgdir/usr/bin"
  ln -sf /usr/bin/MstyClaw "$pkgdir/usr/bin/msty-claw"
}
