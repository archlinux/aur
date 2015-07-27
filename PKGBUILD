# Maintainer: Roberto Valentini <valantin89[at]gmail[dot]com>
pkgname=geppetto
pkgver=4.3.1
_pkgrev=R201501182354
pkgrel=1
arch=('x86_64')
pkgdesc="Eclipse customized version for Puppet"
url="http://puppetlabs.github.io/geppetto/index.html"
source=("https://downloads.puppetlabs.com/geppetto/4.x/geppetto-linux.gtk.${arch}-${pkgver}-${_pkgrev}.zip"
        "geppetto.desktop")
license=("Apache" "EPL")
options=('!strip')
md5sums=('853986a1b86c880008cb46f469b5f48d'
         '5f70f7436790c399b192a01fea3cc29e')

package() {
  cd ${srcdir}

  mkdir -p ${pkgdir}/opt
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/applications
  mkdir -p ${pkgdir}/usr/share/pixmaps

  cp -rf . ${pkgdir}/opt
  ln -s ${pkgdir}/opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

  install -m 0644 geppetto.desktop "${pkgdir}/usr/share/applications/"
  install -Dm 0644 ${srcdir}/${pkgname}/icon.xpm "${pkgdir}/usr/share/pixmaps/geppetto.xpm"
}
