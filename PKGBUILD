pkgname=redox-autoconf
pkgver=2.64
pkgrel=1
epoch=0
pkgdesc="A GNU tool for automatically configuring source code"
arch=('any')
url="https://www.gnu.org/software/autoconf"
license=('GPL2' 'GPL3')
groups=()
depends=('coreutils' 'awk' 'm4' 'diffutils' 'bash')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://ftp.gnu.org/gnu/autoconf/autoconf-${pkgver}.tar.gz")
noextract=()
md5sums=('30a198cef839471dd4926e92ab485361')
sha1sums=('4341f861dac1ec79aecd36ff14df618b55b4e52b')
sha256sums=('a84471733f86ac2c1240a6d28b705b05a6b79c3cca8835c3712efbdf813c5eb6')
sha512sums=('96c4d8ae04c4b3488da0ea5ac67f2450c9ec97363fcc4b2ee288daed885be0e4e3db9e89112245ba7707e3e326d391406c3b194d7ee79882a9044b2d6c27bf55')
validpgpkeys=()

prepare() {
	cd ${pkgname}
}

build() {
	cd ${pkgname}
	./configure --prefix=/opt/autoconf/${pkgver}
	make
}

check() {
	cd "${srcdir}/${pkgname}"
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR=${pkgdir} install
}
