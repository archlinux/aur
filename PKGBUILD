# Contributor: Alexander Mamzikov <av.mamzikov@gmail.com>

pkgname=stereophotoview
pkgver=0.4
pkgrel=1
pkgdesc="A cross platform stereoscopic photo viewer and editor"
arch=('i686' 'x86_64')
url="https://bitbucket.org/av-mamzikov/stereophotoview/wiki/Home"
license=('GPL2')
groups=()
depends=(attr
bzip2
expat
freetype2
gcc-libs
glib2
glibc
graphite
harfbuzz
icu
libcap
libdrm
libffi
libgcrypt
libgpg-error
libpng
libsystemd
libx11
libxau
libxcb
libxdamage
libxdmcp
libxext
libxfixes
libxshmfence
libxxf86vm
lz4
mesa
mesa-libgl
openssl
pcre
qt5-base
qt5-declarative
xz
zlib
)
makedepends=(qt5-base
qt5-tools
qt5-declarative
qt5-multimedia
qt5-quickcontrols
)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=.install
source=(https://bitbucket.org/av-mamzikov/stereophotoview/get/${pkgver}.zip)
noextract=()
md5sums=('333ed040da97d6c04e159a52da17e0d1') #generate with 'makepkg -g'

build() {
  cd "$srcdir"
  test -d build || mkdir build
  cd build
  /opt/Qt/5.5/gcc_64/bin/qmake NoPostInstall=1 PREFIX=${pkgdir}/usr ../av-mamzikov-stereophotoview-0acb5f593d0b
  make
}

package()
{
  cd "$srcdir/build"
  make install
}
