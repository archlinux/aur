# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Wesofer Raymond <wesetoferraymond@gmail.com>
pkgname=logseq-desktop-bin
_pkgname=logseq-desktop
pkgver=0.0.13
pkgrel=1
pkgdesc="A privacy-first, open-source platform for knowledge sharing and management."
arch=("x86_64")
url="https://github.com/logseq/logseq"
license=('AGPL3')
provides=("${pkgname}")
source=("https://github.com/logseq/logseq/releases/download/${pkgver}/logseq-linux-x64-${pkgver}.zip"
      "${_pkgname}.desktop")
md5sums=('2c03410a82c2411c501aa0a3e67439d0'
         '7f1ac5c621059b3959a318882acf990e')

#prepare() {
	#cd "$pkgname-$pkgver"
#}

#build() {
	#cd "$pkgname-$pkgver"
#}

#check() {
#}

package() {
	cd "$srcdir/Logseq-linux-x64"
	    #desktop file
      install -Dm644   $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications/logseq.desktop

      install -Dm644 "$srcdir/Logseq-linux-x64/resources/app/icons/logseq.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

      install -d     ${pkgdir}/opt/${_pkgname}
      cp -r $srcdir/Logseq-linux-x64/* ${pkgdir}/opt/${_pkgname}/

      install -d     ${pkgdir}/usr/bin
      ln -s /opt/${_pkgname}/Logseq ${pkgdir}/usr/bin/logseq
}
