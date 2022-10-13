# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=idle
pkgver=3.10.8
pkgrel=1
pkgdesc="Python Integrated Development and Learning Environment (desktop entry)"
arch=('any')
url="https://packages.debian.org/stable/python/idle"
license=("Python")
groups=()
depends=('python>=3.10' 'python<3.11'
         'hicolor-icon-theme')
optdepends=()
provides=()
conflicts=('idle3'
           'python-idle')
replaces=()
source=('idle.desktop')
sha256sums=('8bbde2b6be32cd47bc4547fb941466fc89d13f2538a2c30594e5e21d83ca0800')


package() {
  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  for _icon in 16 32 48 256; do
    _icon_dir="${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps"
    install -dm644 "${_icon_dir}"
    ln -s /usr/lib/python3.10/idlelib/Icons/idle_${_icon}.png "${_icon_dir}/${pkgname}.png"
  done
}
