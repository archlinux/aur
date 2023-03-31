# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=idle
pkgver=3.10.10
pkgrel=1
pkgdesc="Python Integrated Development and Learning Environment (desktop entry)"
arch=('any')
url="https://packages.debian.org/stable/python/idle"
license=("Python")
groups=()
depends=('python'
         'tk'
         'hicolor-icon-theme')
optdepends=()
makedepends=('python>=3.10' 'python<3.11')
provides=('idle3'
          'python-idle')
conflicts=()
replaces=()
source=('idle.desktop')
sha256sums=('d341c2f5ca1233de8d148f08d54cc08c4d0775eb6d6d28fdc149616d8701d838')


package() {
  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  for _icon in 16 32 48 256; do
    _icon_dir="${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps"
    install -d "${_icon_dir}"
    ln -s /usr/lib/python3.10/idlelib/Icons/idle_${_icon}.png "${_icon_dir}/${pkgname}.png"
  done
}
