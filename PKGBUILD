# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=meshtasticd-bin
_pkgname=meshtasticd
pkgver=2.7.15.48
pkgrel=1
pkgdesc='Meshtastic daemon for Linux systems.'
url='https://download.opensuse.org/repositories/network:/Meshtastic:/beta/Debian_13'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('custom')
depends=('i2c-tools' 'libgpiod' 'ulfius' 'yaml-cpp')
conflicts=("$_pkgname" "$_pkgname-git")
provides=("$_pkgname")
source_x86_64=("$url/amd64/meshtasticd_$pkgver~obsd18f3f7~beta_amd64.deb")
sha512sums_x86_64=('06446b873d57b1bdd5ea249ea1c7980753cff3afada4ba30558d5bfdeee1d6bc65c779fc07969c56f7da684d9d694e18ae10f258e3627230b6c14938771940fe')
source_i686=("$url/i386/meshtasticd_$pkgver~obsd18f3f7~beta_i386.deb")
sha512sums_i686=('f387b02cf1100ae1788fd869f8704d98946c96964ad658b23f9778968ac32bb9e14a9475d22bfeaf0074d3cc13a0f942abd5587623c16c7fa2844c122d2f1477')
source_armv7h=("$url/armhf/meshtasticd_$pkgver~obsd18f3f7~beta_armhf.deb")
sha512sums_armv7h=('64790d0a74b6f0097dbe79711d58a99caf6a5ad27bc50147321826900d7b858aa6f2a07aa663e9158adbabf102963f1596320cafe58d247356639ef25f6c616f')
source_aarch64=("$url/arm64/meshtasticd_$pkgver~obsd18f3f7~beta_arm64.deb")
sha512sums_aarch64=('a92fdac968269ac87d3b25d436fe1974e3ed5edec3f5563d5943c6ed85dce27bb6ff4751f7afd0fd4333232ff2292e4fcfc10a34bfbaccfe5fe68b526cb9d2b8')

# extract bin from deb file
build() {
  tar -xf "$srcdir/data.tar.xz"
}

package() {
  install -Dm755 "$srcdir/usr/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm755 "$srcdir/lib/systemd/system/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"

  mkdir -p $pkgdir/etc/$_pkgname
  cp -R $srcdir/etc/$_pkgname/* $pkgdir/etc/$_pkgname
}
