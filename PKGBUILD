# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=cue-bin
pkgver=0.3.0_beta.5
_pkgver="0.3.0-beta.5"
pkgrel=1
pkgdesc="Validate and define text-based and dynamic configuration"
url="https://github.com/cuelang/cue"
arch=(x86_64)
license=(Apache)
provides=(cue)
conflicts=(cuelang-bin cuelang-cue-git)
source=("https://github.com/cuelang/cue/releases/download/v${_pkgver}/cue_${_pkgver}_Linux_${arch}.tar.gz")
# add dummy entries for `make generate-checksums` to create SHA256 instead of MD5 check sums
sha256sums=("f1ccf4fae2079ecb825e7bf9694f053088a3651c92c1399fdaa0a8d8104f47d5")

package() {
  cd ${srcdir}
  install -Dm755 cue ${pkgdir}/usr/bin/cue
  install -d ${pkgdir}/usr/share/doc/cue
  cp -r doc/* ${pkgdir}/usr/share/doc/cue
}
