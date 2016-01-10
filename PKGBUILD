# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>

pkgname=svn-clean
pkgver=r1162197
pkgrel=1
pkgdesc="Wipe out unversioned files from Subversion working copy"
arch=('any')
url="https://subversion.apache.org/"
license=('GPL')
depends=('subversion' 'perl')
conflicts=('kde-dev-scripts')
source=("svn+https://svn.apache.org/repos/asf/subversion/trunk/contrib/client-side")
sha256sums=('SKIP')

pkgver() {
  cd client-side

  local ver="$(svnversion -c "${pkgname}")"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd client-side

  pod2man svn-clean > svn-clean.1
}

package() {
  cd client-side

  install -D -m 0755 svn-clean "${pkgdir}/usr/bin/svn-clean"
  install -D -m 0644 svn-clean.1 "${pkgdir}/usr/share/man/man1/svn-clean.1"
}

# vim:set ts=2 sw=2 et:
