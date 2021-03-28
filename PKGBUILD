# Maintainer: Tobias Müller <mintuser17 at gmail dot com>

pkgname=teaspeak-server
pkgver=1.4.22
pkgrel=1
pkgdesc="Set up your own Teaspeak Server"
arch=('x86_64')
url='https://teaspeak.de/gb'
license=("custom:${pkgname}")
depends=('nss')
source=("https://repo.teaspeak.de/server/linux/amd64_stable/TeaSpeak-1.4.22.tar.gz")
sha256sums=('6214f0b16282a383e422082350e72affb92f71abef6e19ad8ba4f8dc29eb3aa9')

package() {

  mkdir -p ${pkgdir}/$HOME/${pkgname}
  mkdir -p ${pkgdir}/usr/bin
  cp -r ${srcdir}/* ${pkgdir}/$HOME/${pkgname}
  echo ""
  warning "The TeaSpeak-server files will be installed in $HOME/${pkgname}!"
  warning "You can change the localtion of the files, if you want."
  warning "But dont forget to edit the ´/usr/bin/teaspeak-server´script!"
  echo ""
  warning "You can delete this server, by removing the server folder."
  warning "But dont forget to uninstall the package via pacman, too."
  echo ""
  sleep 15
  touch ${pkgdir}/usr/bin/teaspeak-server
  echo "cd $HOME/teaspeak-server && ./TeaSpeakServer" >> ${pkgdir}/usr/bin/teaspeak-server
  chmod +x ${pkgdir}/usr/bin/teaspeak-server
  chmod -R 750 ${pkgdir}/$HOME/${pkgname}
  chown -R $USER:$USER ${pkgdir}/$HOME/${pkgname}
  
}




