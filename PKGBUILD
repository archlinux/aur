# Maintainer: Connor Prussin <connor@prussin.net>
# Written by distro/aur.sh in https://github.com/cprussin/domicile.
pkgname=domicile-bin
pkgver=1.0.0pre.20261022.043100
pkgrel=1
pkgdesc=A\ Wayland\ compositor\ whose\ renderer\ is\ a\ web\ engine.\ Installs\ the\ \`domicile\`\ login\ session\,\ the\ engine\,\ the\ manganese\ and\ simple\ shells\,\ the\ PAM\ service\ the\ lock\ uses\ and\ the\ \`domicile\`\ group.
arch=(x86_64)
url=https://github.com/cprussin/domicile
license=( MIT\ AND\ BSD-3-Clause )
depends=( glibc\>=2.34 gcc-libs glib2 nss nspr at-spi2-core dbus libcups expat libxkbcommon alsa-lib mesa systemd-libs libinput cairo pango pipewire libglvnd wayland pam systemd )
optdepends=( upower:\ the\ battery\ readout hwdata:\ monitor\ makers\'\ names libpulse:\ pactl\,\ for\ the\ volume\ readout curl:\ bookmark\ icons\ and\ the\ captive\ portal\ check xdg-desktop-portal:\ portals\ for\ apps gsettings-desktop-schemas:\ the\ engine\'s\ GSettings\ schemas\,\ without\ which\ it\ logs\ errors )
provides=(domicile)
conflicts=(domicile)
backup=( etc/pam.d/domicile etc/security/limits.d/10-domicile.conf )
install=domicile.install
source=("domicile-1.0.0pre.20261022.043100-1-x86_64.pkg.tar.zst::https://packages.domicile-desktop.com/arch/x86_64/domicile-1.0.0pre.20261022.043100-1-x86_64.pkg.tar.zst")
noextract=("domicile-1.0.0pre.20261022.043100-1-x86_64.pkg.tar.zst")
sha256sums=(bb73c62ea838ac66b6d5a4361cdf1307ba5279eaa8c44e8c864af6cb513b5b6a)

package() {
  bsdtar -xpf "$srcdir/domicile-1.0.0pre.20261022.043100-1-x86_64.pkg.tar.zst" -C "$pkgdir" \
    --exclude .PKGINFO --exclude .MTREE --exclude .BUILDINFO --exclude .INSTALL
}
