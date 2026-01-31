# Maintainer: NEOAPPS <neo@obsidianos.xyz> <asd22.info@gmail.com>
# Maintainer: TheOddCell <odd@obsidianos.xyz>
pkgname=obsidianos-branding
pkgver=2025.10.12
pkgrel=2
pkgdesc="ObsidianOS branding (os-release and logos)"
arch=('x86_64')
url="https://github.com/Obsidian-OS"
license=('MIT')
depends=(iana-etc)
makedepends=(tar coreutils zstd)
source=("obsidianos.png::https://obsidianos.xyz/logo.png" "os-release::https://obsidianos.xyz/os-release" "filesystem.pkg.tar.zst::https://archlinux.org/packages/core/any/filesystem/download/")
sha256sums=('SKIP' 'SKIP' 'SKIP')
provides=(filesystem)
conflicts=(filesystem)
backup=(
  'etc/crypttab'
  'etc/fstab'
  'etc/group'
  'etc/gshadow'
  'etc/host.conf'
  'etc/hosts'
  'etc/issue'
  'etc/ld.so.conf'
  'etc/nsswitch.conf'
  'etc/passwd'
  'etc/profile'
  'etc/resolv.conf'
  'etc/securetty'
  'etc/shadow'
  'etc/shells'
  'etc/subgid'
  'etc/subuid'
)

package() {
  tar -xvf filesystem.pkg.tar.zst -C "$pkgdir"
  rm "$pkgdir/.MTREE" "$pkgdir/.PKGINFO" "$pkgdir/.BUILDINFO"
  mkdir -p "$pkgdir/usr/share/pixmaps" "$pkgdir/etc"
  cp obsidianos.png "$pkgdir/usr/share/pixmaps/obsidianos.png"
  cp os-release "$pkgdir/etc/os-release"
}
