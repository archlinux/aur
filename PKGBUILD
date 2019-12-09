# Maintainer: Arti Zirk <arti.zirk@gmail.com>
pkgname=disable-ligatures-fantasque-sans-mono
pkgver=1
pkgrel=1
pkgdesc="Disable ligatures on Fantasque Sans Mono font"
arch=('any')
url="https://github.com/belluzj/fantasque-sans/issues/64#issuecomment-555432179"
license=('unknown')
depends=()
source=()
md5sums=()

package() {
  mkdir -p $pkgdir/etc/fonts/conf.d/
  cat << EOF >> $pkgdir/etc/fonts/conf.d/20-disable-ligatures-fantasque-sans-mono.conf
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <match target="font">
        <test name="family" compare="eq">
            <string>Fantasque Sans Mono</string>
        </test>
        <edit name="fontfeatures" mode="assign_replace">
            <string>calt off</string> <!-- disable ligatures -->
            <string>ss01</string> <!-- k without loop -->
        </edit>
    </match>
</fontconfig>
EOF
}

# vim:set ts=2 sw=2 et:
