# Maintainer: Kendoo285 <mathias.rittweger@proton.me>
pkgname=deskreen-ce-bin-next
pkgver=3.2.15
pkgrel=1
pkgdesc="Turn any device into a secondary screen for your computer - Community Edition (binary release, NEXT-branch maintainer)"
arch=('x86_64' 'aarch64')
url="https://github.com"
license=('AGPL-3.0-only')
depends=('avahi' 'gtk3' 'libseccomp' 'nss' 'sqlite' 'systemd-libs')
provides=('deskreen' 'deskreen-ce' 'deskreen-ce-bin')
conflicts=('deskreen' 'deskreen-bin' 'deskreen-ce' 'deskreen-ce-bin')
options=('!strip')

# Saubere Zuweisung der funktionierenden Quelldateien
source_x86_64=("https://sourceforge.net")
source_aarch64=("https://sourceforge.net")

sha256sums_x86_64=('b8328c1a13f869918058991c090ff3a8b58ac79fe65289f589b0e0daf45f4149')
sha256sums_aarch64=('b8328c1a13f869918058991c090ff3a8b58ac79fe65289f589b0e0daf45f4149')

package() {
  # Nutzt die automatische Vorentpackung von makepkg
  cd "${srcdir}"

  # Kopiert die funktionierende Linux-Systemstruktur direkt in das Zielverzeichnis
  if [ -d usr ]; then
    cp -r usr "${pkgdir}/"
  fi

  if [ -d opt ]; then
    cp -r opt "${pkgdir}/"
  fi
}
