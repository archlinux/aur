# Maintainer: epitron <chris@ill-logic.com>
pkgname=kiwix-tools-bin
pkgver=3.1.2
pkgrel=1
pkgdesc="kiwix command line tools (kiwix-serve, kiwix-search, kiwix-manage, kiwix-read) as statically linked binaries"
url='https://www.kiwix.org/en/downloads/kiwix-serve/'
license=(GPL3)
arch=(i686 x86_64)
provides=(kiwix)
conflicts=(kiwix)

if [ ${CARCH} == 'x86_64' ]; then
  _pkg_arch=x86_64
  sha256sums=('63d3e32f184fbc1fdfe4c206575daf3d39b9d949ed7fa38e7ea18bab64e5364e')
else
  _pkg_arch=i586
  sha256sums=('cd9906b99b70c96df5882502c6033cacc099ac3e7695e8db995ba0c72376315c')
fi

source=("https://mirrors.dotsrc.org/kiwix/release/kiwix-tools/kiwix-tools_linux-${_pkg_arch}-${pkgver}.tar.gz")

package() {
  dest="${pkgdir}/usr/bin"
  mkdir -p "$dest"

	cd "${srcdir}/kiwix-tools_linux-${_pkg_arch}-${pkgver}"
  install -t "$dest" kiwix-*
}
