# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=idle
pkgver=3.10.10
pkgrel=2
pkgdesc="Python Integrated Development and Learning Environment (desktop entry)"
arch=('any')
# also has a manual file
# but not worth the effort of downloading a deb for that
url="https://packages.debian.org/stable/python/idle"
license=("Python")
groups=()
depends=('python'
         'tk'
         'hicolor-icon-theme')
optdepends=()
makedepends=('python>=3.10' 'python<3.11')
_pythonver="3.10"
provides=('idle3'
          'python-idle')
conflicts=()
replaces=()
source=('idle.desktop')
sha256sums=('1e8c56ac32b2376da4221cd94b3f255b20d27977b593373808f664c0b968697f')

package() {
  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  for _icon in 16 32 48 256; do
    _icon_dir="${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps"
    install -d "${_icon_dir}"
    ln -s /usr/lib/python${_pythonver}/idlelib/Icons/idle_${_icon}.png "${_icon_dir}/${pkgname}.png"
  done
}
