# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname='pdmenu'
pkgver='1.3.6'
pkgrel='1'
pkgdesc='simple full screen menu program'
arch=('x86_64')
url='https://joeyh.name/code/pdmenu/'
#url='https://packages.debian.org/unstable/source/pdmenu'
license=('GPL')
depends=('gpm' 'slang')
optdepends=('perl')
changelog='ChangeLog'
#_srcdir='pdmenu'
#source=("http://ftp.debian.org/debian/pool/main/p/pdmenu/${_srcdir}-${pkgver}.tar.gz")
_srcdir="pdmenu-${pkgver}"
#source=("http://sources.buildroot.net/pdmenu/${_srcdir}.tar.gz")
#source=("https://dev.gentoo.org/~bkohler/dist/${_srcdir}.tar.gz")
source=("https://git.joeyh.name/index.cgi/pdmenu.git/snapshot/${_srcdir}.tar.gz") # https://git.esiee.fr/leblona/buildroot-project/-/commit/14905c775ca0934a587697fa202dc480278a5aaf
md5sums=('5a74b5f4b153cd37370d5a98a9dde426')
sha256sums=('dedd2a4a5719278b5e49041161990c2f20b5909818837542aaca01819f2c14eb')

build() {
  cd "${_srcdir}"
  CFLAGS="${CFLAGS} -fcommon" \
  ./configure --prefix='/usr' --sysconfdir='/etc'
  make -s
}

package() {
  cd "${_srcdir}"
  make -j1 INSTALL_PREFIX="${pkgdir}" install
}
