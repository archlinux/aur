#Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
#Contributor: Bruno Pagani <archange@archlinux.org>
pkgname=schildichat-web-bin
_pkgver=1.11.36-sc.3
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="SchildiChat is a Matrix client based on Element with a more traditional instant messaging experience."
arch=('x86_64')
url="https://schildi.chat"
license=('Apache')
provides=('schildichat-web')
conflicts=('schildichat-web')
source=("https://github.com/SchildiChat/schildichat-desktop/releases/download/v${_pkgver}/schildichat-web-${_pkgver}.tar.gz")
sha256sums=('f675038cf3bc2c0caa73b099bcb4cbad12a648f747d443a1dbb28f4446f3200d')

package() {
  cd schildichat-web-${_pkgver}

  install -d "${pkgdir}"/{usr/share/webapps,etc/webapps}/schildichat
  cp -r * "${pkgdir}"/usr/share/webapps/schildichat/
  install -Dm644 config.sample.json -t "${pkgdir}"/etc/webapps/schildichat/
  ln -s /etc/webapps/schildichat/config.json "${pkgdir}"/usr/share/webapps/schildichat/
  echo "${pkgver}" > "${pkgdir}"/usr/share/webapps/schildichat/version

}

