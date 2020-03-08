# Maintainer: epitron <chris@ill-logic.com>
pkgname=kiwix-tools-bin
pkgver=3.0.3
pkgrel=1
pkgdesc="kiwix command line tools (kiwix-serve, kiwix-search, kiwix-manage, kiwix-read) as statically linked binaries"
url='https://www.kiwix.org/en/downloads/kiwix-serve/'
license=(GPL3)
arch=(i686 x86_64)
provides=(kiwix)
conflicts=(kiwix)

if [ ${CARCH} == 'x86_64' ]; then
  _pkg_arch=x86_64
  sha256sums=(f92fe2e1c345b0ffc2fe4de7cb0ec5d923f3d751eb98c7eff452d3b1e31fa4d5)
else
  _pkg_arch=i586
  sha256sums=(86bfc1da7fa50b2e865756b54e1b7073d623239cb01883c20f56a21e30ba3247)
fi

source=("https://mirrors.dotsrc.org/kiwix/release/kiwix-tools/kiwix-tools_linux-${_pkg_arch}-${pkgver}.tar.gz")

package() {
  dest="${pkgdir}/usr/bin"
  mkdir -p "$dest"

	cd "${srcdir}/kiwix-tools_linux-${_pkg_arch}-${pkgver}"
  install -t "$dest" kiwix-*
}
