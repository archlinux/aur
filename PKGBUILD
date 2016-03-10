# Maintainer: Yauhen Kirylau <yawghen AT gmail.com>
# Upstream URL: https://wickr.com/

pkgname=wickr-bin
pkgver=2.6.0
pkgrel=2
pkgdesc="Wickr messenger"
PKGEXT='.pkg.tar'
arch=('x86_64')
url="https://wickr.com"
license=('Proprietary')
options=(!strip)
depends=( 'libutil-linux' 'glibc' 'gcc-libs' 'glib2' 'zlib' 'lz4' 'xz'
'libsystemd' 'libdbus' 'libxml2' 'libffi' 'pcre' 'expat' 'json-c' 'libxslt'
'libsndfile' 'libpulse' 'libdrm' 'gstreamer0.10' 'gstreamer0.10-base' 'flac'
'libvorbis' 'libogg' 'mesa' 'libx11' 'libxcb' 'libxrender' 'libxcomposite'
'libxext' 'libxdamage' 'libxfixes' 'libxshmfence' 'libxxf86vm' 'libasyncns'
'orc' 'libxau' 'libxdmcp' 'libcap' 'libgcrypt' 'libgpg-error' 'attr' 'libx264')
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")
source=(
	"https://dls.wickr.com/Downloads/wickr-me_${pkgver}_amd64.deb"
	"wickr-bin.install"
)
md5sums=(
	"5bc94a9634f25630d5171d056e0fa137"
	"ab8afb848c5382aba9a9b6c828e56c1b"
)
install="wickr-bin.install"
package() {
	bsdtar xf data.tar.xz
	chmod -R g-w usr
	mv usr "${pkgdir}"

	ln -s /usr/lib/libx264.so ${pkgdir}/usr/lib/libx264.so.142
}
