# Maintainer: Amiad Bareli <amiad@hatul.info>

pkgname=fonts-ldco
pkgver="20161225"
pkgrel=4
pkgdesc="set of Hebrew fonts by Louis Davis and Co. in OTF and TTF formats."
arch=('any')
url="http://www.ldcodesign.com/%D7%98%D7%99%D7%A4%D7%95%D7%92%D7%A8%D7%A4%D7%99%D7%94/"
license=('OFL')
depends=(fontconfig xorg-fonts-encodings xorg-mkfontscale xorg-mkfontdir)

source=(https://cz.archive.ubuntu.com/ubuntu/pool/universe/l/ldcofonts/"$pkgname"_1.0.0.part3-1.1_all.deb $pkgname.install)
sha256sums=('6747c81ae06939a4b227a6bab6e283e22c3eb106987296e6f513baed50c62209'
		'ed70423495a1ad4222361cfaee05e5566b17a16a913e40d03d319df72e00b685')
install=$pkgname.install

package() {

  bsdtar xvf data.tar.xz
  for type in {opentype,truetype,woff}; do
	  install -dm 755 $pkgdir/usr/share/fonts/$type/ldco
	  install -Dm 644 $srcdir/usr/share/fonts/$type/ldco/* $pkgdir/usr/share/fonts/$type/ldco
  done

}
