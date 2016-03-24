# Maintainer: Arti Zirk <arti.zirk@gmail.com>
pkgname=gimp-font-rendering-fix
pkgver=1
pkgrel=1
pkgdesc="Fixes subpixel font rendering when using infinality fontconfig"
arch=('any')
url="https://bbs.archlinux.org/viewtopic.php?id=195315"
license=('unknown')
depends=('gimp')
source=()
md5sums=()

package() {
  mkdir -p $pkgdir/etc/gimp/2.0/
  cat << EOF >> $pkgdir/etc/gimp/2.0/fonts.conf
<fontconfig>
  <match target="font">
    <edit name="rgba" mode="assign">
      <const>none</const>
    </edit>
  </match>
</fontconfig>
EOF
}

# vim:set ts=2 sw=2 et:
