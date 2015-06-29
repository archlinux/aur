# Maintainer: PhotonX <photon89 [at] gmail.com>.
# Contributor: H.Gökhan Sarı <th0th@returnfalse.net>

pkgname=gtk-theme-divergenceiv-a-new-hope
pkgver=0.7.9
pkgrel=4
pkgdesc="A GTK2 theme with colors black, gray and white."
arch=('any')
url="http://jurialmunkey.deviantart.com/art/Divergence-IV-quot-A-New-Hope-quot-183377193"
license=('GPL')
depends=('gtk-engine-murrine')
optdepends=('python2: Requried for using customizer script.')
if test "$CARCH" == x86_64; then
  optdepends+=('lib32-gtk-engine-murrine: Theme is applied to 32bit-only applications like Skype')
fi
source=('http://fc06.deviantart.net/fs71/f/2011/185/3/5/divergence_iv_____a_new_hope___by_jurialmunkey-d316eqx.zip'
        'py2patch'
        'a-new-hope-customize')
md5sums=('8686e029d9d5fb2f754962ded8ffafa8'  
         '9f3e7f8c7511b963177093de7b98ee89'
         '6604f03aca90d3c411737093d8bb2f14')

build() {
	cd "$srcdir"
	tar -xf A-New-Hope.tar.gz
	# Patch customize script for python2.
	cd "$srcdir/A-New-Hope/"
	patch -p0 < "$startdir/py2patch"
}
package() {
  install -d -m755 "$pkgdir/usr/share/themes"
  install -d -m755 "$pkgdir/usr/bin"
  cp -r "$srcdir/A-New-Hope" "$pkgdir/usr/share/themes/"
  install -m 755 "$startdir/a-new-hope-customize" "$pkgdir/usr/bin/"
}
