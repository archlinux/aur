# Maintainer: Louis Tim Larsen <louis(a)louis.dk>

pkgname=xubuntu-community-artwork
pkgver=18.04.0
pkgrel=3
pkgdesc="Community wallpapers from Xubuntu 14.04, 16.04 & 18.04"
arch=(any)
url="http://xubuntu.org/news/xubuntu-16-04-wallpaper-competition-winners/"
license=('custom')
provides=('xubuntu-community-wallpapers')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/x/"$pkgname"/"$pkgname"_"$pkgver".tar.xz" 'xubuntu-community-wallpapers.xml' 'LICENSE')
sha512sums=('b9274abb7328167b4d6fbb6682e7cdf209665e0bcf2aaaf46caca5d55a2c570d528660aad1ca998b910dec062d30aa56ff629ec70492674c5f99bb551ba7e27f'
            '05c24292941c42086007aa1c8b77f8b3293c3956ee1ae04498f54f5b96a9b987ed7443aa3c9ade9c834e9074ae82822da18ad667a329f581bfcf4850bdc93fc9'
            '1357f5461c3a8a13d7f55ce8744770c69e681062319b535b4aec813caa2911c675ce59e77f9ad2810dd58c4e7f9898a8607d4f9f7b4133e9f0de5c4e5dd1673b')

package() {
  mkdir -p ${pkgdir}/usr/share/xfce4/backdrops ${pkgdir}/usr/share/gnome-background-properties ${pkgdir}/usr/share/mate-background-properties ${pkgdir}/usr/share/licenses/${pkgname}
  cd ${srcdir}/${pkgname}/usr/share/xfce4/backdrops
  cp *.jpg *.png ${pkgdir}/usr/share/xfce4/backdrops/
  cp ${srcdir}/xubuntu-community-wallpapers.xml ${pkgdir}/usr/share/gnome-background-properties/ 
  cp ${srcdir}/xubuntu-community-wallpapers.xml ${pkgdir}/usr/share/mate-background-properties/
  sed -i 's/gnome-wp-list.dtd/mate-wp-list.dtd/' ${pkgdir}/usr/share/mate-background-properties/xubuntu-community-wallpapers.xml 
  cp ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}
