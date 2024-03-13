# Maintainer: Julian Pollinger <julian@pollinger.dev>
_pkgname=muse-sounds-manager
pkgname="$_pkgname-bin"
pkgver=1.1.0.587
pkgrel=4
pkgdesc="Manage MuseScore Libraries"
arch=('x86_64')
url='https://www.musehub.com/'
license=(custom:muse-sounds-manager)
provides=("$_pkgname=$pkgver")
replaces=('muse-hub')
conflicts=('muse-hub')
depends=('fontconfig' 'zlib' 'hicolor-icon-theme')
makedepends=()
install="$_pkgname.install"
source=('https://muse-cdn.com/Muse_Sounds_Manager_Beta.deb' 'LICENSE')
sha256sums=('c3364022399ed5cbfcfa330b88a4fb91442f09bf9486cbce9cb0d5e2108bde1c'
            'ed3c749e7391b70b11717469815ce8fe65a962cf40dd4df88e21bf240b2058b2')
options=('!strip')

package(){
  # Extract package data
  tar -xJ -f data.tar.xz -C "$pkgdir"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/muse-sounds-manager" 

  mkdir -p "${pkgdir}/srv/muse-hub"
}
