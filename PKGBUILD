# Maintainer: Nikita Nikiforov <swrast at disr dot it>
# Contributor: Nikita Nikiforov <swrast at disr dot it>

pkgname="pipewire-autostart"
pkgver="1.0"
pkgrel="1"
pkgdesc="/etc/xdg/autostart files for pipewire, pipewire-pulse and wireplumber."
arch=("any")
depends=("pipewire" "pipewire-pulse" "wireplumber")
license=("ГОЛ-1.1")

package() {
	mkdir -p "${pkgdir}/etc/xdg/autostart"
	cd "${pkgdir}/etc/xdg/autostart"

	tee pipewire.desktop <<EOF
[Desktop Entry]
Name=PipeWire
Comment=Start PipeWire
Icon=pipewire
Exec=pipewire
Terminal=false
Type=Application
NoDisplay=true
EOF
	tee pipewire-pulse.desktop <<EOF
[Desktop Entry]
Name=PipeWire pulse
Comment=Start the PipeWire pulse server
Icon=pipewire-pulse
Exec=pipewire-pulse
Terminal=false
Type=Application
NoDisplay=true
EOF
	tee wireplumber.desktop <<EOF
[Desktop Entry]
Name=WirePlumber
Comment=Start WirePlumber
Icon=pipewire
Exec=wireplumber
Terminal=false
Type=Application
NoDisplay=true
EOF
}
