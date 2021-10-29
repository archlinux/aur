# Maintainer: epitron <chris@ill-logic.com>
pkgname=kiwix-tools-bin
pkgver=3.1.2
pkgrel=5
pkgdesc="kiwix command line tools (kiwix-serve, kiwix-search, kiwix-manage, kiwix-read) as statically linked binaries"
url='https://www.kiwix.org/en/downloads/kiwix-serve/'
license=(GPL3)
arch=(i686 x86_64)
provides=(kiwix)
conflicts=(kiwix)

if [ ${CARCH} == 'x86_64' ]; then
  _pkg_arch=x86_64
  sha256sums=('24e074fa56939b039eaafabc4c9ceff3fd8e5906488d0edc8f78d7bafbaeacbe')
else
  _pkg_arch=i586
  sha256sums=('f194499c3e12013b34da2295e7ecec2baf34e4652b4cdda91b58ffe6b55eca60')
fi
source=("https://mirrors.dotsrc.org/kiwix/release/kiwix-tools/kiwix-tools_linux-${_pkg_arch}-${pkgver}-${pkgrel}.tar.gz")

package() {
  dest="${pkgdir}/usr/bin"
  mkdir -p "$dest"

	cd "${srcdir}/kiwix-tools_linux-${_pkg_arch}-${pkgver}-${pkgrel}"
  install -t "$dest" kiwix-*
}
