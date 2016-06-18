# Maintainer: Pieter Lenaerts <pieter.aj.lenaerts@gmail.com>
pkgname=emusicj-bin
pkgver=0.28
pkgrel=1
epoch=
pkgdesc="Download manager for the eMusic.com music service. Pre-compiled binary from official repository"
arch=('i686' 'x86_64')
url="http://www.kallisti.net.nz/EMusicJ/HomePage"
license=('GPL')
conflicts=('emusicj')
depends=('java-runtime')
source=('emusicj.desktop')
source_i686=("http://www.kallisti.net.nz/wikifiles/EMusicJ/emusicj-linux-i686-$pkgver.tar.gz")
source_x86_64=("http://www.kallisti.net.nz/wikifiles/EMusicJ/emusicj-linux-x86_64-$pkgver.tar.gz")
md5sums=('bfb23618c610575f273bb785576671fb')
md5sums_i686=('3c6aac0c8ae256263973c42b308cfac5')
md5sums_x86_64=('d38cfd8d88b7f0a612b435375ff2a2d7')
sha512sums=('1093ff98127412c80d69db7e1e10b5cfaebf4f91b01c843ffb2c6bebd7a33e798ae135de1f05d3b3d64c211e00c052b73ece54b29b7aedeb85deaa6e9978f796')
sha512sums_i686=('c531d35cc3e71924ede060f5538e5f4926e66aa76cc14d31acd023d9b0d8ab433017d40d560e047442151e331c503d316d9901d4421ebce1528fed59eb8421b0')
sha512sums_x86_64=('83c02ffb1930eaee996821b90322437e1c8a071d6e6ca548b46a2b59fcd6799199f6024d7cba3b288524ef144aa12f14e146c4eeb229a5b4ad798ba2ed1be46b')

package() {
	install -dm755 "$pkgdir"/{opt,usr/bin}
	install -Dm644 $srcdir/emusicj.desktop $pkgdir/usr/share/applications/emusicj.desktop
	install -Dm644 "$srcdir/emusicj-linux/emusicj.xpm" "$pkgdir/usr/share/pixmaps/emusicj.xpm"
	cp -R "$srcdir/emusicj-linux" "$pkgdir/opt/emusicj"
	ln -s "/opt/emusicj/emusicj" "$pkgdir/usr/bin/emusicj"
}

