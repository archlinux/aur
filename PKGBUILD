# Maintainer: Gabriel Moura <develop@srmoura.com.br>

pkgname=sweethome
pkgrel=1
pkgver=6.0
pkgdesc="An interior design application that helps you put your furniture in your home on a 2D plan, with a 3D preview."
url="http://www.sweethome3d.com"
provides=('sweethome')
arch=('x86_64')
license=('GPL')
#epends=()
#ptdepends=()
#/kedepends=()
#ackup=()
install=''

source=('https://ufpr.dl.sourceforge.net/project/sweethome3d/SweetHome3D/SweetHome3D-6.0/SweetHome3D-6.0-linux-x64.tgz'
'SweetHome.desktop'
'sweethome.sh')

sha512sums=('f9b9ab57802d1855f840698ba0bb08179a03c61ad013af261bce23bd01a1a7623b2c6273f2b65b299e163a2b6394ca18a49d00f32ae0c189c7c7c435a0634152'
'a5cc4cd6ddef7d8be259018d38870da3f511601f43abf262ef4ec73123bf2e1f8a2e7383c43c507b4c013901a4ccd689602858e10211ebc975bcb482ed7a6db5'
'f291c8796ef3476921161b7efe30aa7872a3a62a0570dc70edeb6ea079af454e279271b7b703e90c3b87b4e474ad27235e4f9a4381ffb5b5a68081ffa576164d'
)

package() {
    install -d "$pkgdir"/opt
    cp -R "$srcdir"/SweetHome3D-6.0 "$pkgdir"/opt/sweethome

   find "$pkgdir"/opt/sweethome -type f -exec chmod 644 {} \;
   chmod 755 "$pkgdir"/opt/sweethome/SweetHome3D
   chmod 755 "$pkgdir"/opt/sweethome/jre8/bin/java
  # ln -s /opt/sweethome/SweetHome3D /bin/sweethome
  #  install -d "$pkgdir"/usr/bin

   install -D -m755 "./sweethome.sh" "${pkgdir}/usr/bin/sweethome"
   # install -D -m644 "./eula.html" "${pkgdir}/usr/share/licenses/${pkgname}/eula.html"
   install -D -m644 "./SweetHome.desktop" "${pkgdir}/usr/share/applications/SweetHome.desktop"
   install -D -m644 "${pkgdir}/opt/sweethome/SweetHome3DIcon.png" "${pkgdir}/usr/share/pixmaps/sweethome.png"
}
