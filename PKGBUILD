# Maintainer: Alper Ortac <alportac@gmail.com>
pkgname=vinci-client-bin
pkgver=0.3.1
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
source=("vinci-${pkgver}-amd64.deb::vinci://578803025" 'download.sh')
sha256sums=('bf46602337e56861d97d3e1b5c4d5055d48eb92430dd78acf7276889e5d8e430'
            '690e066bdf9fddc809d5810903966c5109bc8aaf75a2cf55c837e9e1f3147c5a')

package() {
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
