# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=weblogo
pkgver=3.4.1
pkgrel=1
pkgdesc="A web based application designed to make the generation of sequence logos as easy and painless as possible"
url="http://weblogo.threeplusone.com"
arch=('i686' 'x86_64')
license=('custom (MIT)')
optdepends=('python')
depends=('ghostscript')
source=("https://github.com/WebLogo/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('7201942b419ca8fbb9395a11b0e34f9c')
#options=(!strip docs libtool emptydirs !zipman staticlibs !upx)

build(){
msg "building"
#TODO: build the python stuff
}

package() {
#TODO: install the python stuff

# put the src into opt
mkdir -p "${pkgdir}/opt/${pkgname}"
cp -a ${srcdir}/${pkgname}-${pkgver}/* "${pkgdir}/opt/${pkgname}/."

# link the exe
mkdir -p ${pkgdir}/usr/bin
ln -s /opt/${pkgname}/weblogo ${pkgdir}/usr/bin/.

# install license file
install -m644 -D "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:#

