# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Contributor: Romain Schmitz <slopjong .at. slopjong .dot. de>
# Forked from Phillipe Smith <phillipe@archlinux.com.br>

pkgname='astah-professional'
_pkgname=${pkgname//-/_}
pkgver='8.0.0'
_pkgver=${pkgver//./_}
pkgrel=1
_pkgrel=d641d4
pkgdesc='Leightweight software design tool for creating UML, ERD, DFD, Flowchart...etc. and easy-to-use UML2.x modeler'
arch=('any')
url="http://astah.net/editions/professional"
conflicts=('astah_community' 'astah-uml')
license=('custom:none')
depends=('java-runtime=8')
source=("http://cdn.change-vision.com/files/astah-professional_${pkgver}.${_pkgrel}-0_all.deb"
	"LICENSE")
md5sums=('c1e65102592ad5f000b76c418f328853'
         '2814d9b8bac8bd6e929292d39b429a69')
install="astah-professional.install"


package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf $srcdir/data.tar.gz -C "$pkgdir/"

  rm -r ${pkgdir}/usr/share/doc
  install -Dm644 $srcdir/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE || return 1

#  mv ${pkgdir}/usr/lib/astah_professional ${pkgdir}/usr/lib/astah-professional
#  sed -i -r "s|^(ASTAH_HOME=).*|\1/usr/lib/$pkgname|" ${pkgdir}/usr/lib/astah-professional/astah-pro

#  rm ${pkgdir}/usr/bin/astah-pro
#  ln -s ${pkgdir}/usr/bin/astah-pro /usr/lib/astah-professional/astah-pro
}
