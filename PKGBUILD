# Maintainer: justbrowsing <developer4linux+aur@gmail.com>
pkgname=justbrowsing-home
pkgver=1.1
pkgrel=3
_gitname="justbrowsing-config-files"
_username="user"
_userdir="/home/${_username}"
pkgdesc="Home directory for JustBrowsing"
arch=('any')
url="https://github.com/justbrowsing/justbrowsing-config-files"
license=('unknown')
depends=('shadow' 'withlock-svn')
makedepends=('unzip')
optdepends=('justbrowsing-firefox-profile: Firefox browser profile' 
            'justbrowsing-chrome-profile: Google Chrome browser profile')
source=(https://github.com/justbrowsing/${_gitname}/archive/master.zip)
install=$pkgname.install
md5sums=('59cacf1ac2cad427842f9aff15fca297')

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
