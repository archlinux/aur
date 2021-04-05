# Maintainer: Tobias Müller <mintuser17 at gmail dot com> (Package Maintainer)
# Contributor: Markus Hadenfeldt <support at teaspeak dot de> (Program Maintainer)

pkgname=teaspeak-server
pkgver=1.4.22
pkgrel=1
pkgdesc="Set up your own Teaspeak Server for the Teaspeak Client."
arch=('x86_64')
url='https://teaspeak.de/gb'
license=("custom:${pkgname}")
depends=('nss')
source=("https://repo.teaspeak.de/server/linux/amd64_stable/TeaSpeak-1.4.22.tar.gz")
sha256sums=('6214f0b16282a383e422082350e72affb92f71abef6e19ad8ba4f8dc29eb3aa9')

package() {

  mkdir -p ${pkgdir}/opt/${pkgname}
  mkdir -p ${pkgdir}/usr/bin
  cp -r ${srcdir}/* ${pkgdir}/opt/${pkgname}
  echo ""
  echo "+---------------------------------------------------------------------+"
  echo -e "\e[32m The TeaSpeak-server files will be installed in /opt/${pkgname}! \e[0m"
  echo -e "\e[32m You can easily run the server via the command ´teaspeak-server´. \e[0m"
  echo -e "\e[32m If you want to change the location of the server files, \e[0m"
  echo -e "\e[32m dont forget to edit the ´/usr/bin/teaspeak-server´ script. \e[0m"
  echo ""
  echo -e "\e[32m You can delete this server, by removing the server folder. \e[0m"
  echo -e "\e[32m But dont forget to uninstall the package via pacman, too. \e[0m"
  echo "+---------------------------------------------------------------------+"
  echo ""
  touch ${pkgdir}/usr/bin/teaspeak-server
  echo "cd /opt/teaspeak-server && ./TeaSpeakServer" >> ${pkgdir}/usr/bin/teaspeak-server
  chmod +x ${pkgdir}/usr/bin/teaspeak-server
  chmod -R 750 ${pkgdir}/opt/${pkgname}
  chown -R $USER:$USER ${pkgdir}/opt/${pkgname}
  
}




