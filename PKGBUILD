# Maintainer: Jorge <jorge.barroso.11@gmail.com>

pkgname=gimp-extras
pkgver=2.0.1
pkgrel=4
pkgdesc="The extra brushes and patterns from ubuntu"
arch=('any')
url="http://packages.ubuntu.com/search?searchon=names&keywords=gimp-data-extras"
license=('GPL2')
depends=('gimp')
source=(http://de.archive.ubuntu.com/ubuntu/pool/universe/g/gimp-data-extras/gimp-data-extras_2.0.1-3_all.deb)

package() {
cd "${srcdir}"

tar -xf ${srcdir}/data.tar.gz
install -m755 -d "${pkgdir}/usr/"
cp -r "${srcdir}/usr/" "${pkgdir}"

sed 's|usr/local|usr|' -i "${pkgdir}/usr/share/doc/gimp-data-extras"/*
sed 's|usr/local|usr|' -i "${pkgdir}/usr/share/gimp/2.0"/*/*
}

# vim:set ts=2 sw=2 et: 
sha512sums=('88e88abcf5b0fd583ce7946593e294b11a549330c5af8667d1f3afeb68de4a37bb97667cc3cb6f791f3c663b578a00fd7f6f7446fff35c86df9e33436a30bf08')
