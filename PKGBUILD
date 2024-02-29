# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=godot3-as-bin
pkgver=3.5.3
pkgrel=1
pkgdesc="Advanced cross-platform 2D and 3D game engine (3.X Branch), utilize godot3-bin"
arch=("x86_64")
url='https://godotengine.org'
license=('MIT')
depends=(libglvnd libxcursor libxi libxinerama libxrandr godot3-bin) # Depends() is small due to godot binary static linking libraries
provides=(godot3)
conflicts=(godot3)
optdepends=(pipewire-alsa pipewire-pulse)

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cat >> "${pkgdir}/usr/bin/godot3" <<EOF
#!/bin/sh
/opt/godot3-bin/Godot_v${pkgver}-stable_x11.64 "\$@"
EOF
  chmod +x "${pkgdir}/usr/bin/godot3"
}
