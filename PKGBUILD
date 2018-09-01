# Maintainer: robertfoster
# Contributor: said
# Contributor: Ner0
# Contributor: farnsworth517

pkgname=soulseekqt
pkgver=20180130
_pkgver=2018-1-30
pkgrel=2
pkgdesc="A desktop client for the Soulseek peer-to-peer file sharing network"
arch=('x86_64')
url="http://www.soulseekqt.net/news/"
license=('CUSTOM')
depends=('fontconfig' 'libxext' 'libxrender' 'qt5-multimedia')
source=("https://www.dropbox.com/s/0vi87eef3ooh7iy/SoulseekQt-${_pkgver}-64bit.tgz"
	$pkgname.desktop
)

package () {
	cd $srcdir

	./SoulseekQt-${_pkgver}-64bit.AppImage  --appimage-extract

	cd squashfs-root

	install -vDm755 SoulseekQt "$pkgdir/usr/bin/$pkgname"
	install -vDm644 soulseek.png "$pkgdir/usr/share/pixmaps/soulseek.png"
	install -vDm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

md5sums=('1d98331893bc9b9d45ba34f6523353ab'
         '810a4200a3c8568257b66b6bdea5c29c')
