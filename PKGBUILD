# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Contributor: Romain Schmitz <slopjong .at. slopjong .dot. de>
# Forked from Phillipe Smith <phillipe@archlinux.com.br>

pkgname='astah-professional'
_pkgname=${pkgname//-/_}
pkgver='8.3.0'
_pkgver=${pkgver//./_}
pkgrel=1
_pkgrel=b9757d
pkgdesc='Lightweight software design tool for creating UML, ERD, DFD, Flowchart...etc. and easy-to-use UML2.x modeler'
arch=('any')
url="http://astah.net/editions/professional"
conflicts=('astah_community' 'astah-uml')
license=('custom:none')
depends=('java-runtime=8')
source=("http://cdn.change-vision.com/files/astah-professional_${pkgver}.${_pkgrel}-0_all.deb"
	"LICENSE"
	"PRIVACY")
md5sums=('099ed4d9149ab796f0b3eff8bd2b2f01'
         '561f5c40b2575ae0f8a497e261e862ff'
         'fc2db9678cbfbec17049f050743e7960')
install="astah-professional.install"


package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf $srcdir/data.tar.gz -C "$pkgdir/"

  rm -r ${pkgdir}/usr/share/doc
  install -Dm644 $srcdir/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE || return 1
  install -Dm644 $srcdir/PRIVACY ${pkgdir}/usr/share/licenses/${_pkgname}/PRIVACY || return 1

#  mv ${pkgdir}/usr/lib/astah_professional ${pkgdir}/usr/lib/astah-professional
#  sed -i -r "s|^(ASTAH_HOME=).*|\1/usr/lib/$pkgname|" ${pkgdir}/usr/lib/astah-professional/astah-pro

#  rm ${pkgdir}/usr/bin/astah-pro
#  ln -s ${pkgdir}/usr/bin/astah-pro /usr/lib/astah-professional/astah-pro
}
