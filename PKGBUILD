# Maintainer: Janek Thomaschewski <janek@thomaschewski.dev>

pkgname=homematic-manager-bin
pkgver=2.7.0
pkgrel=1
pkgdesc='Homematic Device Configuration and Administration'
arch=('x86_64')
url='https://github.com/hobbyquaker/homematic-manager'
license=('GPL3')
depends=('gtk3' 'libnotify' 'nss' 'xdg-utils' 'libxss' 'libsecret')
provides=('homematic-manager')
conflicts=('homematic-manager')
options=('!strip')
source=("https://github.com/hobbyquaker/homematic-manager/releases/download/${pkgver}/homematic-manager_${pkgver}_amd64.deb")
sha256sums=('61697706efb06f496b2ed3f18fc791a5042961fac0f63430d865f404b901ff76')

package() {
  # extract package data
  tar xf data.tar.xz -C "${pkgdir}"

  # install symbolic link in /usr/bin
  install -d -m755 "${pkgdir}/usr/bin"
  ln -s "/opt/Homematic Manager/homematic-manager" "${pkgdir}/usr/bin"
}
