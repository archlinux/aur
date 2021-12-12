# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Edgard Castro <castro@edgard.org>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Icaro Perseo <icaroperseo[at]protonmail[dot]com>
# Contributor: Lucas Saliés Brum <lucas@archlinux.com.br>

pkgname=papirus-icon-theme-git
pkgver=20211201.r29.gc2c35ba3ab
pkgrel=1
epoch=1
pkgdesc="A free and open source SVG icon theme based on Paper Icon Set"
arch=('any')
url="https://git.io/papirus-icon-theme"
license=('GPL3')
depends=('gtk-update-icon-cache')
makedepends=('git')
optdepends=('hardcode-fixer-git: To deal with hardcoded application icons'
            'hardcode-tray-git: To fix hardcoded tray icons'
            'sif-git: To fix icons of running Steam games'
            'gnome-shell-extension-appindicator: Integrates AppIndicators on GNOME')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install='alt-icons.install'
options=('!strip')
source=('git+https://github.com/PapirusDevelopmentTeam/papirus-icon-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
