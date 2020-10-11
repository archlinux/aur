# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=session-settings
_author=elementary
pkgname=pantheon-session
pkgver=5.0.3
pkgrel=2
pkgdesc="Session settings for Pantheon"
arch=('any')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
groups=('pantheon-stable')
depends=('cerbere' 'dconf' 'libgala.so=0-64' 'gnome-keyring'
         'gnome-session' 'gnome-settings-daemon'
         'pantheon-applications-menu' 'pantheon-dpms-helper' 'plank'
         'libwingpanel-2.0.so=0-64' 'xdg-user-dirs-gtk')
makedepends=()
optdepends=('pantheon-default-settings')
provides=("${_gitname}")
conflicts=("${_gitname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=("acba82053719804cf5751e27c36ab26b")

package() {
  cd "${srcdir}/${_gitname}-${pkgver}"

  mkdir -p "${pkgdir}"/{etc/xdg,usr/share/{gnome-session,pantheon}}
  cp -dr --no-preserve='ownership' applications "${pkgdir}"/usr/share/pantheon/
  cp -dr --no-preserve='ownership' autostart "${pkgdir}"/etc/xdg/
  cp -dr --no-preserve='ownership' gnome-session "${pkgdir}"/usr/share/gnome-session/sessions
  cp -dr --no-preserve='ownership' xsessions "${pkgdir}"/usr/share/
}

