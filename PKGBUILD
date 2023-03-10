# Maintainer: Julian Flake <flake_at_uni-koblenz_dot_de>
# Contributor: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Contributor: Romain Schmitz <slopjong .at. slopjong .dot. de>
# Forked from Phillipe Smith <phillipe@archlinux.com.br>

pkgname='astah-professional'
_pkgname=${pkgname//-/_}
pkgver='8.4.0'
_pkgver=${pkgver//./_}
pkgrel=1
_pkgrel=8fdff6
pkgdesc='Full-Featured Software Modeling Tool for creating UML, ER Diagrams, DFD, Flowchart and more to create a clear understanding of your software design among teams.Easy-to-use UML2.x modeler'
arch=('any')
url="http://astah.net/products/astah-professional"
conflicts=('astah_community' 'astah-uml')
license=('custom')
depends=('jdk8-adoptopenjdk')
source=("https://cdn.change-vision.com/files/astah-professional_${pkgver}.${_pkgrel}-0_all.deb"
	"https://astah.net/wp-content/uploads/2020/11/AstahLicenseAgreement-16th.pdf"
	"LICENSE"
	"PRIVACY")
md5sums=('1abc30ad92ae563f998f7d7decfad580'
         '979e8679714321d906983391b2b851b2'
         '6b77c443f8468a61dc027a042599abee'
         'fc2db9678cbfbec17049f050743e7960')
install="astah-professional.install"


package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf $srcdir/data.tar.gz -C "$pkgdir/"

#  rm -r ${pkgdir}/usr/share/doc
  install -Dm644 $srcdir/AstahLicenseAgreement-16th.pdf ${pkgdir}/usr/share/licenses/${_pkgname}/AstahLicenseAgreement-16th.pdf || return 1
  install -Dm644 $srcdir/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE || return 1
  install -Dm644 $srcdir/PRIVACY ${pkgdir}/usr/share/licenses/${_pkgname}/PRIVACY || return 1
}
