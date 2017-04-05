# Maintainer: Bastian Löher <b.loeher@gsi.de>
pkgname=fairsoft
pkgver=mar17
pkgrel=1
pkgdesc="Software collection provided by GSI/FAIR for analysis."
arch=('x86_64')
url="http://fairroot.gsi.de"
license=('LGPL3')
groups=()
makedepends=('cmake'
	'clang'
	'bison'
	'flex'
	'gcc-fortran'
	'subversion'
	'git'
	'curl')
depends=(
	'libiodbc'
	'fcgi'
	'sqlite'
	'java-environment'
	'glu'
	'fftw'
	'cfitsio'
	'postgresql-libs'
	'python'
	'libjpeg-turbo'
	'graphviz'
	'libx11'
	'libxft'
	'libxext'
	'libxpm'
	'libxmu'
	)
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs' '!strip' 'staticlibs' 'libtool')
install='fairsoft.install'
changelog=
source=("https://github.com/FairRootGroup/FairSoft/archive/${pkgver}.tar.gz"
	'arch.conf'
	'fairsoft.install')
noextract=()
md5sums=('959b176f06137ae37ad1d0ad7c181daf'
         '932f0e4d2d03c062de12651b278c947b'
         '748ceeb13cf954c4f732f93023ae879e')

# Do not compress the package for installation
# PKGEXT='.pkg.tar'
# Compress using lightweight gzip
PKGEXT='.pkg.tar.gz'

prepare() {
	mv FairSoft-$pkgver FairSoft
	cd "FairSoft"
}

build() {
	:
}

package() {
	installdir=${pkgdir}/opt/fairsoft/${pkgver}-${pkgrel}/src

	cd "FairSoft"

	mkdir -p ${installdir}

	# Install files
	cp -r ${srcdir}/* ${installdir}
}
