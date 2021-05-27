# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=tempest-bin
pkgver=1.5.3
pkgrel=1
depends=(
	'jre-openjdk-headless'
	'jre-openjdk'
	'jdk-openjdk'
	'openjdk-doc'
	'openjdk-src'
)
pkgdesc="a tool for investigating the temporal signal and 'clocklikeness' of molecular phylogenies"
arch=('x86_64')
url="http://tree.bio.ed.ac.uk/software/tempest/"
license=('GPL2')
source=("http://tree.bio.ed.ac.uk/download.php?id=102&num=3" "tempest.desktop")
sha256sums=('83e482a7ba946e38606cc3331765db45b4331337d92d030ebeb537e3e16fa44e'
            '2af28c04f9d96f046947efeab28c27552be88ac56af0d8f1a0db2e439a228c45')

package() {
    install -dm755 "$pkgdir"/usr/{bin,share/{applications,tempest}}
    install -m 755 ${srcdir}/*.desktop ${pkgdir}/usr/share/applications
    mv ${srcdir}/TempEst_v${pkgver}/* ${pkgdir}/usr/share/tempest
    chmod +x  ${pkgdir}/usr/share/tempest/bin/tempest
    ln -s /usr/share/tempest/bin/tempest ${pkgdir}/usr/bin/tempest
}

