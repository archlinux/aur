# Maintainer: Alper Ortac <alportac@gmail.com>
pkgname=vinci-client-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Vinci, your second brain (prebuilt; requires private repository access)'
arch=('x86_64')
url='https://github.com/meetvinci/vinci'
license=('LicenseRef-proprietary')
depends=('glibc' 'libgcc' 'gtk3' 'webkit2gtk-4.1' 'libsoup3' 'glib2' 'cairo' 'gdk-pixbuf2' 'dbus' 'hicolor-icon-theme')
makedepends=('github-cli')
provides=("vinci=$pkgver")
conflicts=('vinci')
options=('!strip' '!debug')
# gh uses the caller's login or GH_TOKEN. No credentials are stored here.
DLAGENTS+=("vinci::/usr/bin/bash ${startdir}/download.sh %u %o")
source=("vinci-${pkgver}-amd64.deb::vinci://567538388" 'download.sh')
sha256sums=('03eda658d3ff2644d4428dd41d0c6a05bfba2841996806af2ef6f5a15ceaab77'
            '690e066bdf9fddc809d5810903966c5109bc8aaf75a2cf55c837e9e1f3147c5a')

package() {
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
