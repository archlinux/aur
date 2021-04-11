 
# Maintainer: Leszek Lesner <leszek@zevenos.com>
# Contributor: Lane Kohen < fx@hi2.in >
pkgname=rootactions-servicemenu
pkgver=2.7.3
_pkgver=2.7.3+p20201123+git20201207.1957
pkgrel=1
pkgdesc="Allows admin users to perform several root only actions from dolphin via polkit agent developed by "
arch=(any)
_arch=amd64
url="https://netrunner.com"
license=(GPL)
groups=(admin)
depends=(dolphin kdialog perl polkit)
optdepends=(kate)
conflicts=(kde-servicemenus-rootactions)
source=("http://ds9-eu.s3-eu-central-1.amazonaws.com/dci/packages/netrunner/pool/extras/r/rootactions-servicemenu/${pkgname}_${_pkgver}_${_arch}.deb")
sha256sums=('20065254c2d7ac1d0ac569177106911d778dd737bbd33784512986fef1a0791b')

package() {
    tar xvf data.tar.xz -C "${pkgdir}"/
    chmod  644  "$pkgdir/usr/share/kservices5/ServiceMenus/10-rootactionsfolders.desktop"
    chmod  644  "$pkgdir/usr/share/kservices5/ServiceMenus/11-rootactionsfiles.desktop"
    chmod  755  "$pkgdir/usr/bin/rootactions-servicemenu.pl"
    chmod  644  "$pkgdir/usr/share/polkit-1/actions/com.netrunner.pkexec.rootactions.policy"
    chmod  644  "$pkgdir/usr/share/doc/$pkgname/copyright"
    chmod  644  "$pkgdir/usr/share/doc/$pkgname/changelog.gz"
} 
