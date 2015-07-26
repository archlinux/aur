# Maintainer: justbrowsing <developer4linux+aur@gmail.com>
pkgname=justbrowsing-home
pkgver=1.2
pkgrel=2
_gitname="justbrowsing-home"
_username="user"
_userdir="/home/${_username}"
pkgdesc="Home directory for JustBrowsing"
arch=('any')
url="https://github.com/justbrowsing/justbrowsing-home"
license=('unknown')
depends=('shadow' 'withlock')
makedepends=('')
optdepends=('justbrowsing-firefox-profile: Firefox browser profile' 
            'justbrowsing-chrome-profile: Google Chrome browser profile')
source=(https://github.com/justbrowsing/${_gitname}/archive/master.tar.gz)
install=$pkgname.install
md5sums=('a1a8730926b28808ecfba7d60a96dee6')

package() {
  cd "$srcdir/${_gitname}-master"
  mkdir -p ${pkgdir}/${_userdir}/{.config/nitrogen,.i3,.locks}
  chmod 0700 "${pkgdir}/${_userdir}"

  install -m644 ".config/nitrogen/nitrogen.cfg" "${pkgdir}/${_userdir}/.config/nitrogen/nitrogen.cfg"
  install -m644 ".config/nitrogen/bg-saved.cfg" "${pkgdir}/${_userdir}/.config/nitrogen/bg-saved.cfg"
  install -m644 ".i3/config" "${pkgdir}/${_userdir}/.i3/config"
  install -m644 ".wbar" "${pkgdir}/${_userdir}/.wbar"
  install -m644 ".xinitrc" "${pkgdir}/${_userdir}/.xinitrc"
}
