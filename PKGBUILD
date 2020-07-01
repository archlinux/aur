# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname='pdmenu'
pkgver='1.3.4'
pkgrel='1'
pkgdesc='simple full screen menu program'
arch=('x86_64')
# url='https://joeyh.name/code/pdmenu/'
url='https://packages.debian.org/unstable/source/pdmenu'
license=('GPL')
depends=('gpm' 'slang')
optdepends=('perl')
changelog='ChangeLog'
source=("http://ftp.debian.org/debian/pool/main/p/pdmenu/pdmenu_${pkgver}.tar.gz")
md5sums=('0623b992572511d5fd90d481c426fa40')
sha256sums=('302aa81b8868133ff5a0f3e3e897f71d425bc628c0d7439addb623f12c277bea')

build() {
  cd 'pdmenu'
  CFLAGS="${CFLAGS} -fcommon" \
  ./configure --prefix='/usr' --sysconfdir='/etc'
  make -s
}

package() {
  cd 'pdmenu'
  make -j1 INSTALL_PREFIX="${pkgdir}" install
}
