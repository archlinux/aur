# Maintainer: Julian Flake <flake_at_uni-koblenz_dot_de>
# Contributor: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Contributor: Romain Schmitz <slopjong .at. slopjong .dot. de>
# Forked from Phillipe Smith <phillipe@archlinux.com.br>

pkgname='astah-professional'
_pkgname=${pkgname//-/_}
pkgver='10.1.0'
_pkgver=${pkgver//./_}
pkgrel=1
_pkgrel=9ceee1
pkgdesc='Full-Featured Software Modeling Tool for creating UML, ER Diagrams, DFD, Flowchart and more to create a clear understanding of your software design among teams.Easy-to-use UML2.x modeler'
arch=('any')
url="http://astah.net/products/astah-professional"
conflicts=('astah_community' 'astah-uml')
license=('custom')
depends=('jre21-openjdk')
source=("https://cdn.change-vision.com/files/astah-professional_${pkgver}.${_pkgrel}-0_all.deb"
	"LICENSE"
	"PRIVACY")
md5sums=('73fd8f692f3977d5721e9afc43a3f572'
         '4667d0dfa5bde4924e3cea64fb310e94'
         'd041a1336f18d00a99baa330b0e25fb9')
install="astah-professional.install"


package() {
    msg2 "Extracting the data.tar.xz..."
    bsdtar -xf $srcdir/data.tar.xz -C "$pkgdir/"

    #  rm -r ${pkgdir}/usr/share/doc
    install -Dm644 $srcdir/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE || return 1
    install -Dm644 $srcdir/PRIVACY ${pkgdir}/usr/share/licenses/${_pkgname}/PRIVACY || return 1
}
