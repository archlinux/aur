# Maintainer: Thomas Scheiblhuber <thomas@scheiblhuber.de>
# Contributor: Joonas Henriksson
# Contributor: Rutger Broekhoff
# Contributor: gatitofeliz at protonmail dot com
pkgname=natron-portable
pkgver=2.1.5
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc='Video compositing software similar to Nuke and Adobe After Effects, portable snapshot'
url='http://natron.fr/'
license=('GPL')
depends=('ffmpeg' 'p7zip')
optdepends=('blender: for 3d opencolor-io support')
conflicts=('natron')

options=('!strip')

source=("natron.desktop" "x-natron.xml" "natronIcon256_linux.png" "natronProjectIcon_linux.png")
source_i686=("https://bitbucket.org/juanperez89/natron/downloads/Natron-2.1.5-Linux-x86_32bit-portable.tar.xz")
source_x86_64=("https://bitbucket.org/juanperez89/natron/downloads/Natron-2.1.5-Linux-x86_64bit-portable.tar.xz")
md5sums=('5c65b106c295abe0b5346eff18a06767' 'ca5186feb5a7f336517c015f72d0f8c8' '60eb9f97a0ddeab5acda48d15894559a' '475e14142c51d8b545f7cbc4b5426ce2')
md5sums_i686=('3c76260bfe992f8d05d45ffb9a2ab8a5')
md5sums_x86_64=('df3bca1c6a10d4e9aad49330841491c2')
sha256sums_i686=('1ff38af24afbe55c4ef70d01d80f724ebc16c6a6a5aff6e5187493b2bfeb9d15')
sha256sums_x86_64=('950c9be33d6b879f8567776b959d4196c058e3e1501f95507fb12b2782a731e4')
sha384sums_i686=('43855a7bea9a80911073e738981c549cfd5c41a74186b3fb0fc04896a5c3473e1dd2baa91dd21517f94b5a0d257c15d6')
sha384sums_x86_64=('a4290c470fbff74bff318299a0f130fb19c756ddd3f4a8bd55598694597ebe612438eb1ab6d7c2a47f257223d3225d2b')
sha512sums_i686=('27746d158711ea0dc5b34ed1b65cce7b31695a750475c682cb64b479aaa385423d93c64c7e51dc3b902761b3a4f95e76927cec3578b8c081f419eb5c75c05c06')
sha512sums_x86_64=('7ba29fb83d841d2207d3aec0013a122457cffa7442ccaea5c941d3a4ce59c22e9f4062f869fec0c606b44e52dc7bfa2e115b4f729db5d72b1837d24ccd04681b')
sha1sums_i686=('dc78bea76437dce216fc3f07b592dab038bcd937')
sha1sums_x86_64=('a4b44cc53ac49fd124f8c15ea6a320767ab127bf')

package() {
	if [ "$CARCH" = "x86_64" ]; then
		_source_arch="x86_64bit"
	else
		_source_arch="x86_32bit"
	fi

	install -d "$pkgdir"/opt
	cp -R "$srcdir"/Natron-$pkgver-Linux-$_source_arch "$pkgdir"/opt/natron

	install -d "$pkgdir"/usr/bin
	ln -s ../../opt/natron/Natron "$pkgdir"/usr/bin/natron
        install -D "$srcdir"/natronIcon256_linux.png "$pkgdir"/usr/share/pixmaps/natronIcon256_linux.png
        install -D "$srcdir"/natronProjectIcon_linux.png "$pkgdir"/usr/share/pixmaps/natronProjectIcon_linux.png
        install -Dm644 "$srcdir"/natron.desktop "$pkgdir"/usr/share/applications/natron.desktop
        install -D "$srcdir"/x-natron.xml "$pkgdir"/usr/share/mime/packages/x-natron.xml
}
